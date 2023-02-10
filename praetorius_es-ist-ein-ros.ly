\version "2.11.51"
\include "gregorian.ly"

htitle=\markup \italic {"Es ist ein Ros entsprungen"}
hcomposer=\markup \smallCaps{ "M. Praetorius"}

ss=\once \set suggestAccidentals = ##t
molle=^\markup{\musicglyph #"accidentals.vaticanaM1"}

incipit =
#(define-music-function (parser location incipit-music) (ly:music?)
#{
\once \override Staff.InstrumentName.self-alignment-X = #RIGHT
\once \override Staff.InstrumentName.self-alignment-Y = ##f
\once \override Staff.InstrumentName.padding = #0.3
\once \override Staff.InstrumentName.stencil =
#(lambda (grob)
(let* ((instrument-name (ly:grob-property grob 'long-text)))
(set! (ly:grob-property grob 'long-text)
#{ \markup
\score
{
{ \context MensuralStaff \with {
instrumentName = #instrument-name
\remove "Time_signature_engraver"
} $incipit-music
}

\layout { $(ly:grob-layout grob)
line-width = \indent
indent =
% primitive-eval is probably easiest for
% escaping lexical closure and evaluating
% everything respective to (current-module).
#(primitive-eval
'(or (false-if-exception (- indent incipit-width))
(* 0.5 indent)))
ragged-right = ##f
ragged-last = ##f
system-count = #1 }
}
#})
(system-start-text::print grob)))
#}) 

global = {
  \override Staff.BarLine #'transparent = ##t
   \set Score.skipBars = ##t
   \override Voice.NoteHead.style = #'baroque
   \key g \dorian
   \time 2/2
   \repeat unfold 17 { \skip 1 \bar "" \skip 1}
  
 
  % the final bar line is not interrupted
  \revert Staff.BarLine #'transparent
  \bar "|." \stopStaff
}

%#(set-global-staff-size 18)
\paper {
  % s.a. book.paper !
  print-page-number = ##f
  %  paper-height = 10\cm
  left-margin = 2.5\cm
  right-margin = 2.1\cm
  %  top-margin = 0\cm
  %  bottom-margin = 0\cm
}

globalGL = {
  \time 3/2
  \key f \major
  % \partial 1 
  \tempo 2=80
  % Do not output tempo marking on pdf
  \set Score.tempoHideNote = ##t
  %\override Staff.BarLine.stencil = ##f
  %\override NoteHead #'style = #'baroque
  \override Score.BarNumber.break-visibility = #all-visible
  \override Score.BarNumber.break-visibility = #end-of-line-invisible
  \set Score.barNumberVisibility = #(every-nth-bar-number-visible 2)
  \set Score.currentBarNumber = #1
}


staffSoprano = 
	
	\relative c'' {
		
	
	\clef treble
	
\override NoteHead #'style = #'baroque


c1 c2 c
d c c1
a bes
a2 g1
f e2
f1 \break
c'1 c2 c
d c c1
a bes
a2 g1
f e2
f1
r2 a g e \break
f d c1
r2 c'2 c2 c
d c c1
a bes
a2 g1
f e2
f\longa






	\bar "|."
	}


staffAlto = 
	
	\relative c'' { 
		
	\clef treble

\override NoteHead #'style = #'baroque


a1 a2 f
f f e1
d d
c d2. a4
c1 c
a'1 a2 f
f f e1
d d
c d2. a4
c1 c
r2 f2 d c
c2 b c4 d e2
r2 e g f
f f e1
d d
f2 d e f
g c, c\longa



	\bar "|."
	}


staffTenor = 
	
	\relative c' { 	
		
	
	\clef "G_8"

\override NoteHead #'style = #'baroque

c1 c2 a
bes a g1
f f
a2 c bes a1
g2 a1
c1 c2 a
bes a g1
f f
a2 c bes a1
g2 a1
r2 c bes a
a g g1
r2 g g a
bes a g1
fis g
c2 bes a1
g1 a\longa

 
	\bar "|."
	}


staffBass = 
	\relative c {
\clef bass
f1 f2 f
bes f c1
d bes
f'2 e d1
c f,
f'1 f2 f
bes f c1
d bes
f'2 e d1
c f,
r2 f' g a
f g c,1
r2 c e f
bes, f' c1
d g,
a2 bes c1
c1 f,\longa


	
	\clef bass
	
\override NoteHead #'style = #'baroque
	


	\bar "|."
}

staffTenorGL = \relative c' { 	
\globalGL \clef bass

c2 c4 a
bes a g2
f f
a4 c bes a2
g4 a2\fermata\breathe
c2 c4 a
bes a g2
f f
a4 c bes a2
g4 a2\fermata
r4 c bes a
a g g2
r4 g g a
bes a g2
fis\breathe g
c4 bes a2
g2 a1
\override Staff.BarLine.stencil = ##t 
\bar "|."
	}

staffBassGL = 
	\relative c {
	  \globalGL
\clef bass
f2 f4 f
bes, f' c2
d bes
f'4 c d bes 
c2 f,\fermata\breathe \break
f'2 f4 f
bes, f' c2
d bes
f'4 c d bes
c2 f,\fermata \break
r4 f' g a
f g c,2
r4 c e f
bes, f' c2\break
d\breathe g,
a4 bes c2
c2 f,1 \override Staff.BarLine.stencil = ##t
\bar "|."
}

staffBassGLacc = 
	\relative c {
	  \globalGL \clef G
 \repeat unfold 17
  {
    s1
    \break
  }	  
  s2
%\bar "|."
}	  

gbzi = \figures{
  s1 s s s2 <4 6>4 <7> <4 6>4 <3 5> 
  s1 s s s <4 6>4 <7> <4 6>4 <3 5>
  s1 s2. <_!>4
  s1 <6>4 s1 s4 <_+>
  s2. <6>4 <6>  \bassFigureExtendersOn <5 6>4 <4 6>
  \bassFigureExtendersOff <4> <3>
  %<6>8 <6\\> 
  %s2. <[7]>8 <6> <6>4 s2.
  %s4 <6> <6> s
  %<6>4 <_!> s2
  %<_! 7 >4 <5 6> s4 <6> 
  %<5 6>4 \bassFigureExtendersOn <4 7>8 <3! 7>
}	
	
incipitcantus=\new MensuralVoice = "incipitcantus" <<

{ \relative c'' {
\clef "petrucci-c1"
\key f \major
s2
  }
}
>>

incipitaltus=\new MensuralVoice = "incipitcantusII" <<

{ \relative c' {
\clef "petrucci-c3"
\key  f \major
s2
  }
}
>>

incipittenor=\new MensuralVoice = "incipitaltus" <<

{ \relative c' {
\clef "petrucci-c4"
\key  f \major
s2

  }
}
>>

incipitbassus=\new MensuralVoice = "incipitbassus" <<

{ \relative c {
\clef "petrucci-f"
\key  f \major
s2
  }
}
>>




testoa = \lyricmode {
  
  \set stanza = "1."
  
   Es ist ein Ros ent -- sprun -- gen aus ei --  ner Wur -- zel zart, wie
  uns die Al -- ten sun -- gen: Von Jes --  se kam die Art und hat ein Blüm -- 
  lein 'bracht mit --  ten im kal --  ten Win --  ter, wohl zu der hal --  ben Nacht.
  
  
 }
 
 testoaa = \lyricmode {
  
  \set stanza = "2."
  
   Das Rös -- lein, das ich mei -- ne, da -- von Je -- sa -- ia sagt,
   ist Ma -- ri -- a, die Rei -- ne, die uns das Blüm -- lein bracht'.
   Aus Got -- tes ew' -- gem Rat hat sie ein Kind ge -- bo -- ren und blieb doch rei -- ne Magd.
  
  
 }
 
 testoaaa = \lyricmode
{
  \set stanza = "3."
  Das Blü -- me -- lein so klei -- ne, das duf -- tet uns so süß, mit
  sei -- nem hel -- len Schei -- ne ver -- treibt die Fins -- ter -- 
  nis: Wahr' Mensch und wah -- rer Gott, hilft uns aus al -- lem Lei -- 
  de, ret -- tet von Sünd' und Tod.
}
 
 
 testob = \lyricmode {
   
   \set stanza = "1."
  
   Es ist ein Ros' ent -- sprun -- gen aus ei --  ner Wur -- zel zart, wie
  uns die Al -- ten sun -- gen: Von Jes --  se kam die Art und hat ein Blüm -- 
  lein 'bracht __ _ _ mit --  ten im kal --  ten Win --  ter, wohl zu __ _ _ der hal --  ben Nacht.
  
  
 }
 
  testobb = \lyricmode {
   
   \set stanza = "2."
  
    Das Rös -- lein, das ich mei -- ne, da -- von Je -- sa -- ia sagt,
   ist Ma -- ri -- a, die Rei -- ne, die uns das Blüm -- lein bracht'.
   Aus Got -- tes ew' -- gem Rat __ _ _ hat sie ein Kind ge -- bo -- ren und blieb __ _ _ doch rei -- ne Magd.
  
  
 }
 
  testobbb = \lyricmode
{
  \set stanza = "3."
  Das Blü -- me -- lein so klei -- ne, das duf -- tet uns so süß, mit
  sei -- nem hel -- len Schei -- ne ver -- treibt die Fins -- ter -- 
  nis: Wahr' Mensch und wah -- rer Gott, __ _ _ hilft uns aus al -- lem Lei -- 
  de, ret -- tet __ _ _  von Sünd' und Tod.
}
 
 testoc = \lyricmode {
   
   \set stanza = "1."
  
   Es ist ein Ros' ent -- sprun -- gen aus ei --  ner Wur -- _ zel zart, wie
  uns die Al -- ten sun -- gen: Von Jes --  se kam __ _ die Art und hat ein Blüm -- 
  lein 'bracht mit --  ten im kal --  ten Win --  ter, wohl zu der hal --  ben Nacht.
  
  
 }
 
  testocc = \lyricmode {
   
   \set stanza = "2."
  
   Das Rös -- lein, das ich mei -- ne, da -- von Je -- sa -- _ ia sagt,
   ist Ma -- ri -- a, die Rei -- ne, die uns das Blüm -- _ lein bracht'.
   Aus Got -- tes ew' -- gem Rat hat sie ein Kind ge -- bo -- ren und blieb doch rei -- ne Magd.
  
  
 }
 
 
  testoccc = \lyricmode
  
{
  \set stanza = "3."
  Das Blü -- me -- lein so klei -- ne, das duf -- tet uns __ _ so süß, mit
  sei -- nem hel -- len Schei -- ne ver -- treibt die Fins -- _ ter --
  nis: Wahr' Mensch und wah -- rer Gott, hilft uns aus al -- lem Lei -- 
  de, ret -- tet von Sünd' und Tod.
}



\book {

 \paper{
	evenHeaderMarkup=\markup  \fill-line { \hcomposer \htitle \fromproperty #'page:page-number-string   }
	oddHeaderMarkup= \markup  \fill-line { \on-the-fly #not-first-page \fromproperty #'page:page-number-string \on-the-fly #not-first-page \htitle \on-the-fly #not-first-page \hcomposer   }
	
	system-system-spacing =
	#'((basic-distance . 10) (minimum-distance . 12) (padding . 3))
	
  }

	
\header {
	title = \markup \smallCaps "Es ist ein Ros entsprungen"
	composer = \markup \center-column { "Anonimo, XVI sec." "arm. Michael Prætorius (1571 -1621)" }
	copyright = \markup \teeny { \vspace #5  "© 2016 by CPDL. This edition can be fully distributed, duplicated, performed, and recorded. Typesetting by Francesco Spiga."}
	poet = \markup \left-column { \line { \smallCaps {M. Praetorius,}\italic {Musæ Sioniæ,} } \line { 6. Theil, 1605, Regensburg } \line { "   " } }
	piece = \markup\italic"(nach GL 243)"
}


\markup{\null \vspace #2 \null}
\score { 
	<<
% 	\new StaffGroup = choirStaff 	<<
% 		  \new Voice = "cantus" <<
% 		          \global
% 		           \set Staff.instrumentName =  #"[Cantus]  "
% 		           \incipit \incipitcantus
% 		           \staffSoprano
% 		            >>
% 		               
% 		           \new Lyrics \lyricsto "cantus" { \testoa } 
% 		           \new Lyrics \lyricsto "cantus" { \testoaa } 
% 		           \new Lyrics \lyricsto "cantus" { \testoaaa } 
% 		        
% 		     
% 		  \new Voice = "cantusII" <<
% 		          \global
% 		           \set Staff.instrumentName =  #"[Altus]    "
% 		           \incipit \incipitaltus
% 		           \staffAlto
% 		            >>
% 		               
% 		           \new Lyrics \lyricsto "cantusII" { \testob }
% 		           \new Lyrics \lyricsto "cantusII" { \testobb }
% 		           \new Lyrics \lyricsto "cantusII" { \testobbb }
% 		           
% 		  
% 		   \new Voice = "altus" <<
% 		          \global
% 		           \set Staff.instrumentName =  #"[Tenor]   "
% 		           \incipit \incipittenor
% 		           \staffTenor
% 		            >>
% 		               
% 		           \new Lyrics \lyricsto "altus" { \testoc }
% 		           \new Lyrics \lyricsto "altus" { \testocc }
% 		           \new Lyrics \lyricsto "altus" { \testoccc }
% 		          
% 		
% 		  \new Voice = "tenor" <<
% 		          \global
% 		           \set Staff.instrumentName = #"[Bassus]  "
% 		           \incipit \incipitbassus
% 		           \staffBass
% 		            >>
% 		               
% 		           \new Lyrics \lyricsto "tenor" {\testoa }
% 		           \new Lyrics \lyricsto "tenor" { \testoaa } 
% 		           \new Lyrics \lyricsto "tenor" { \testoaaa } 
% 	>>
        \new Staff {\set Staff.instrumentName = "Vlc." \staffTenorGL}
        %\new Staff {\set Staff.instrumentName = "m.d." \staffBassGLacc}
        \new Staff {\set Staff.instrumentName = "Basso/Org." \staffBassGL}
	%\gbzi 
	>>
 
  
  \midi { \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 48 1)
    }
	}
  
  \layout {  indent = 2.5\cm
              incipit-width = 1\cm
              ragged-last=##f

	
	
 
  	  
  	  \context {
         \Score
         \remove "Bar_number_engraver"
         
       }
 \context {
      \Staff
      \consists Custos_engraver
      \override Custos #'style = #'mensural
    
    }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      \override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
}


% \markup { 
% \fill-line {
% \column {
% 
% \hspace #0.8 % adds vertical spacing between verses
% \line { \bold "1. "
% \column {
%  
%   "Es ist ein Ros entsprungen" 
%   "aus einer Wurzel zart," 
%   "wie uns die Alten sungen:" 
%   "Von Jesse kam die Art" 
%   "und hat ein Blüm lein 'bracht" 
%   "mitten im kalten Winter," 
%   "wohl zu der halben Nacht."
%   
% }
% }
% \vspace #1 % adds vertical spacing between verses
% \line { \bold "2. "
% \column {
%    "Das Röslein, das ich meine," 
%    "davon Jesaia sagt,"
%    "ist Maria, die Reine," 
%    "die uns das Blümlein bracht'."
%    "Aus Gottes ew'gem Rat" 
%    "hat sie ein Kind geboren" 
%    "und blieb doch reine Magd."
%   
% }
% }
% 
% \vspace #1 % adds vertical spacing between verses
% \line { \bold "3. "
% \column {
% 
%   "Das Blümelein so kleine," 
%   "das duftet uns so süß," 
%   "mit seinem hellen Scheine" 
%   "vertreibt die Finster nis:" 
%   "Wahr' Mensch und wahrer Gott," 
%   "hilft uns aus allem Leide," 
%   "rettet von Sünd' und Tod."
% 
% }
% }
% 
% \vspace #5
% 
% }
% 
% }
% }
% 
% 
 }
