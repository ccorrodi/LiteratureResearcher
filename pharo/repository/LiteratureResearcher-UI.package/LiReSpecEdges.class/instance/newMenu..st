instance creation
newMenu: anItem
	| menu |
	menu := MenuModel new.
	menu
		addGroup: [ :group | 
			group
				addItem: [ :mi | 
					mi
						name: 'Select in graph';
						action: [ selectEdgeBlock cull: anItem ] ] ].
	^ menu