\header {
  title = "Froh und heiter. Rheinländer (A13)"
  composer = "fkel"
}

vlc=\relative c' {
\time 2/4  \clef bass \key g \major 
\repeat volta 2{
g4 g,8 b16 d %1
g4 g,16 a b c %2
d8 d d4 %3
g8 b d16 c b a %4
g4 g,8 b16 d %5
g4 g,16 a b c %6
d16 e fis g a8 d, %7
g d g r %8
}
\repeat volta 2{
\key d \major
d16 d d d d d d d %9
d16 d d d d8 fis %10
a8 a a a
d8 b a16 g fis e %12
d8 d16 d d d d d %13
d8 d d16 e fis8 %14
g16 fis e d cis a' a8 %15
}
\alternative{
  {d,8 d d r}
  {d8 d d } %17
}
\repeat volta 2{
\key g \major
d8 | g4 g %18
g8 g g4 %19
d8 d fis4 %20
g8 b g d
g8 g g4
g8 g g4
d8 d d fis
g8 d g 
}
\repeat volta 2{
\key c \major
c,8 | c4 c %26
c4 e
f4 g
c,16 d e g c4
c,4 c %30
c4 e
g8 d g16 g, a b
c8 g c 
 }
}

\score {
  \new Staff {\set Staff.instrumentName = "Vlc." \vlc}

  \layout {}
  \midi {}
}