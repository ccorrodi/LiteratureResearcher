instance creation
fromText: aString graph: aGraph
	^ (super fromText: aString graph: aGraph)
		bibtex: (LiReBibParser parse: '@inproceedings{GENERATED,title={' , aString , '}}') entries first;
		document: nil;
		yourself