
if(!exists("w0")) {
    w0=13.5
}

if(!exists("h0")) {
    h0=7
}

if(!exists("fontsize")) {
    fontsize=12
}

if(!exists("contours")) {
    contours = 0
}

if(!exists("define_margins")) {
    define_margins = 1
}

if(!exists("lmarg")) {
    lmarg=1.2
}

if(!exists("rmarg")) {
    rmarg=1.8
}

if(!exists("tmarg")) {
    tmarg=0.7
}

if(!exists("bmarg")) {
    bmarg=1.25
}


set terminal epslatex size w0 cm,h0 cm color colortext standalone linewidth 2 font sprintf('lmr,%d', fontsize)
set output "plot.tex"

if(define_margins) {

    if(rmarg>=0) {
        set rmargin at screen 1-rmarg/w0
    } else {
        set rmargin rmarg
    }
    if(lmarg>=0) {
        set lmargin at screen lmarg/w0
    } else {
        set lmargin lmarg
    }
    if(bmarg>=0) {
        set bmargin at screen bmarg/h0
    } else {
        set bmargin bmarg
    }
    if(tmarg>=0) {
        set tmargin at screen 1-tmarg/h0
    } else {
        set tmargin tmarg
    }
}

unset key

set title offset 0,-0.5
set xtics out nomirror offset 0,0.2
set ytics out nomirror offset 0.4,0

set xlabel offset 0,0.5
set ylabel offset 1.5,0

set cbtics out nomirror

set cbtics offset -0.5,0
set format cb "%.1f"
