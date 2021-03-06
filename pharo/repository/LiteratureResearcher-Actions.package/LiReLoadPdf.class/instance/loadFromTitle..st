as yet unclassified
loadFromTitle: anArticle
	| rows rowWithUrl |
	rows := [ scholarPy findByTitle: (anArticle bibtex at: #title) value ]
		on: LiReScholarPyProcessError
		do: [ :e | 
			Transcript
				show: e;
				cr.
			^ nil ].
	rowWithUrl := rows detect: [ :r | (r at: #urlPdf) isNotNil or: [ (r at: #url) isNotNil ] ] ifNone: [ ^ nil ].
	anArticle mergeBibtexWithCsv: rowWithUrl.
	^ self loadFromUrl: anArticle