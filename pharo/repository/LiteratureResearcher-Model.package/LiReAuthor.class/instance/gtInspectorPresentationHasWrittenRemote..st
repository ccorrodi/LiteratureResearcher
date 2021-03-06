as yet unclassified
gtInspectorPresentationHasWrittenRemote: aComposite
	<gtInspectorPresentationOrder: 3>
	| model |
	model := (LiReSpecScholarPy node: self)
		selectBlock: [ :n | n announcer announce: (LiReRequestSelectNode entity: n) ];
		loadBlock: [ :d | announcer announce: (LiReRequestLoadWrittenByFromCsv node: self csv: d) ];
		searchBlock: [ | value lock |
			lock := Semaphore new.
			announcer
				announce:
					(LiReRequestScholarPy
						block: [ :s | 
							[ value := s findByAuthors: {name} ]
								ensure: [ lock signal ] ]).
			lock wait.
			value ];
		yourself.
	model searchText disable.
	aComposite spec
		title: [ 'Has written (remote)' ];
		display: [ model
				buildWithSpec;
				yourself ]