tests
testGetBibtex
	| out |
	out := scholarPy getBibtex: clusterId.
	self assert: out isEmpty not