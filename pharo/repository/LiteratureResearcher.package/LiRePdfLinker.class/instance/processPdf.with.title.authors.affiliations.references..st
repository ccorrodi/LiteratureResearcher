as yet unclassified
processPdf: anId with: aFileReference title: anOrderedCollection authors: anotherOrderedCollection affiliations: yetAnotherOrderedCollection references: yetYetAnotherOrderedCollection
	| result |
	result := FileReference newTempFilePrefix: 'LiRePdfLinker' suffix: '.pdf'.
	subprocess
		execute:
			{(LiReSubprocess escape: anId).
			(LiReSubprocess escape: aFileReference pathString).
			(LiReSubprocess escape: result pathString).
			(LiReSubprocess escape: (String streamContents: [ :stream | (NeoJSONWriter on: stream) nextPut: anOrderedCollection ])).
			(LiReSubprocess escape: (String streamContents: [ :stream | (NeoJSONWriter on: stream) nextPut: anotherOrderedCollection ])).
			(LiReSubprocess escape: (String streamContents: [ :stream | (NeoJSONWriter on: stream) nextPut: yetAnotherOrderedCollection ])).
			(LiReSubprocess escape: (String streamContents: [ :stream | (NeoJSONWriter on: stream) nextPut: yetYetAnotherOrderedCollection ]))}
		wait: 10 seconds.
	result exists
		ifFalse: [ LiRePdfLinkerProcessError signal: 'Expected "' , result pathString , '" to exist, but it does not' ].
	^ result