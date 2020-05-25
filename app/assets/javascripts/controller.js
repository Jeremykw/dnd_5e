var referenceController = referenceController || {};

referenceController.init = function () {
	// initiates starting state
	const state = new referenceState.baseState;
	referenceController.show(state)
}

referenceController.show = function (currentState) {
	const state = currentState;
	if (referenceCategories[state.currentPage]) { // if their is a stub in referenceCategories
		state.data = referenceCategories[state.currentPage];
		referenceView.draw(state);		
	}else{
		console.log(state.url)
		fetch(state.url)
			.then( response => response.json())
			.then( data => {
				state.data = state.dataFactory(data); // assign data to results
				referenceView.draw(state); // pass state to viewDraw
			})
			.catch( err => console.log( `their was an error with with the network conection: ${err}` ) );
	}
}

referenceController.update = function (e, currentState) {
	// update state based on event
	const state = currentState;
	state.lastPage = currentState.currentPage;
	state.currentPage = e.target.id;
	state.pageType = state.typeOfPage(state.currentPage);
	state.url = state.buildUrl(e.target.id); 
	referenceController.show(state);
}



