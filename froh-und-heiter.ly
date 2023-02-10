\header {
  title = "froh und heiter"
  composer = "Composer"
}

vlc=\relative c' {
\time 2/4  \clef bass \key g \major 
g4 g,8 b16 d %1
g,4 g16 a b c %2
d8 d d4 %3
g8 b d16 c b a %4
g4 g,8 b16 d %5
g4 g,16 a b c %6
d16 e fis g a8 d, %7
g d g r \bar "||" %8
\key d \major
d16 d d d d d d d %9
d16 d d d d8 fis %10
a8 a a a
d8 b a16 g fis e %12
d4
  }

\score {
  \vlc

  \layout {}
  \midi {}
}
