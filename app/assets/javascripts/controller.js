var referenceController = referenceController || {};

referenceController.init = function () {
	// initiates starting state
	const state = new referenceState.baseState;
	referenceView.initNav(state);
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
	const id = e.target.id;
	state.pageHistory.push(state.currentPage)
	state.currentPage = id;
	state.pageType = state.typeOfPage(state.currentPage);
	state.url = state.buildUrl(id); 
	console.log(`hist = ${state.pageHistory}, cur = ${state.currentPage}, for = ${state.pageForward}`)
	referenceController.show(state);
}

referenceController.handleNav = function (e, currentState) {
	console.log(e.target.id)
	let state = currentState;
	// Update state based on nav direction
	if (e.target.id === 'reference_nav_back'){
		state = referenceController.navBack(state);
	}else {
		state = referenceController.navForward(state);
	}
	state.url = state.buildUrl(state.currentPage); 
	console.log(`hist = ${state.pageHistory}, cur = ${state.currentPage}, for = ${state.pageForward}`)
	referenceController.show(state);
}

referenceController.navBack = function (currentState) {
	const state = currentState;
	state.pageForward.push(state.currentPage); //add current page to the forward list
	state.currentPage = state.pageHistory[state.pageHistory.length -1]; // assign last page in history to current page
	state.pageHistory.pop(); // remove new current page from history
	state.pageType = state.typeOfPage(state.currentPage);
	return state;
}

referenceController.navForward = function (currentState) {
	const state = currentState;
	state.pageHistory.push(state.currentPage);
	state.currentPage = state.pageForward[state.pageForward.length -1];
	state.pageForward.pop();
	state.pageType = state.typeOfPage(state.currentPage);
	return state;
}




