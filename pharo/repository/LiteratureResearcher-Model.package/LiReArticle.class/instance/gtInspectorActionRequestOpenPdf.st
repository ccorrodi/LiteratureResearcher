as yet unclassified
gtInspectorActionRequestOpenPdf
	<gtInspectorAction>
	^ GLMGenericAction new
		title: 'Open PDF';
		position: 4;
		enabledCondition: [ bibtex hasField: #pdf ];
		action: [ :p | announcer announce: (LiReRequestOpenPdf article: self) ]