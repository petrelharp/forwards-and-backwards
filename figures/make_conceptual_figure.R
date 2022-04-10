

##########
# diagram of continuous-space model

draw_circle <- function (xy, r, radius_label, ...) {
    xy <- unlist(xy)
    theta <- seq(0, 2*pi, length.out=101)
    polygon(xy[1] + r * cos(theta),
            xy[2] + r * sin(theta), ...)
    if (!missing(radius_label)) {
        segments(x0=xy[1], y0=xy[2], x1=xy[1] + r)
        text(xy[1] + r/2, xy[2], labels=radius_label, pos=3, cex=2)
    }
}

set.seed(30)
N <- 100
epsilon <- 0.2
sigma <- 0.2
H <- 1
W <- 1
xy <- data.frame(
            x=W * (runif(N) - 0.5),
            y=H * (runif(N) - 0.5)
        )

xy <- xy[order(xy$x^2 + xy$y^2),]

cairo_pdf(file="conceptual_figure.pdf", width=6, height=3, pointsize=10)
layout(t(1:2))
# gamma, mu
par(mar=c(4,4,1,1), mgp=c(2.5, 0.75, 0))
    f <- function (x, dt=0.1) { (1 - exp(-dt * x))/dt }
    curve(f(x), lwd=2,
          xlim=c(0, 2.5),
          ylim=c(-0.5, 2),
          xlab='density / N',
          ylab='rates (per capita)'
    )
    theta <- 0.5
    curve(f(x^(1+theta)), col='red', lwd=2, add=TRUE)
    abline(v=1, lty=2)
    abline(h=0, lty=2)
    legend("right", lwd=2, lty=1, col=c('black', 'red', 'blue'),
           legend=c("birth (γ)", "death (μ)", "net (F)"))
    curve(f(x) - f(x^(1+theta)), lwd=2, col='blue', add=TRUE)
mtext("A", adj=-0.3, line=-1, cex=1.5)

# circles
par(mar=c(1,1,1,1))
    k <- 29
        plot(xy$x, xy$y, type='n',
             xlim=c(-1, 1) * W/2, ylim=c(-1, 1) * H/2,
             asp=1, xaxt='n', xlab='', yaxt='n', ylab='')
        draw_circle(xy[k,], epsilon, col=adjustcolor("red", 0.5), lwd=2, radius_label=expression(epsilon),
                    border=adjustcolor('red', 0.25))
        points(xy[k,1], xy[k,2], cex=2, pch=20)
        in_circle <- setdiff(which((xy$x - xy[k,1])^2 + (xy$y - xy[k,2])^2 < 1.8 * epsilon^2), k)
        arrows(x0=xy$x[in_circle], y0=xy$y[in_circle],
               x1=0.8 * xy[k,1] + 0.2 * xy$x[in_circle],
               y1=0.8 * xy[k,2] + 0.2 * xy$y[in_circle],
               col=adjustcolor('red', 0.5), lwd=1,
               length=0.1
        )
        points(xy$x, xy$y, pch=20)
    k <- 34
        n <- 12
        draw_circle(xy[k,], sigma, col=adjustcolor("blue", 0.25), lwd=2, radius_label=expression(sigma),
                    border=adjustcolor('blue', 0.25))
        points(xy[k,1], xy[k,2], cex=2, pch=20)
        dd <- cbind(xy[k, 1] + rnorm(12, sd=sigma),
                    xy[k, 2] + rnorm(12, sd=sigma))
        dd <- dd[abs(dd[,1]) < W/2 & abs(dd[,2]) < H/2,]
        arrows(
            x0=xy[k,1], y0=xy[k,2],
            x1=dd[,1], y1= dd[,2],
            col=adjustcolor('blue', 0.5), lwd=1,
            length=0.1
        )
mtext("B", adj=-0.1, line=-1, cex=1.5)
dev.off()
