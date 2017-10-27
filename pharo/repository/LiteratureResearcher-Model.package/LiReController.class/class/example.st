example
example
	| article graph controller server |
	graph := LiReGraph new.
	article := LiReArticle
		graph: graph
		bibtex:
			(LiReBibParser
				parse:
					(Character lf asString
						join:
							{'@inproceedings{nguyen2010recurring,' . '  title={Recurring bug fixes in object-oriented programs},' . '  author={Nguyen, Tung Thanh and Nguyen, Hoan Anh and Pham, Nam H and Al-Kofahi, Jafar and Nguyen, Tien N},'.
							'  booktitle={Proceedings of the 32Nd ACM/IEEE International Conference on Software Engineering-Volume 1},' . '  pages={315--324},' . '  year={2010},' . '  organization={ACM},' . '  url={http://dl.acm.org/citation.cfm?id=1806847}'.
							'}'})) entries first
		metadata: nil.
	controller := LiReController graph: graph.
	graph nodes add: article.
	server := LiRePdfLinkerUriSchemeServer controller: controller.
	LiRePdfLinkerUriSchemeServer adoptAsDefault: server.
	server start.
	^ controller