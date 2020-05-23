var referenceController = referenceController || {};

referenceController.init = function () {
	const state = new referenceState.baseState;
	referenceController.show(state)
}

referenceController.show = function (currentState) {
	const state = currentState;
	if (referenceCategories[state.currentPage]) {
		state.data = referenceCategories[state.currentPage];
		referenceView.draw(state);		
	}else{
		console.log(state.url)
		fetch(state.url)
			.then( response => {
				return response.json();
			})
			.then( data => {
				console.log(JSON.stringify(data.results))
				state.data = data.results;
				referenceView.draw(state);
			})
			.catch( err => console.log( `their was an error with with the network conection: ${err}` ) );
	}
}

referenceController.update = function (e, currentState) {
	const state = currentState;
	state.lastPage = currentState.currentPage;
	state.currentPage = e.target.id;
	state.url = state.buildUrl(e.target.id); 
	referenceController.show(state);
}



