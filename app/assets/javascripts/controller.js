var referenceController = referenceController || {};

referenceController.init = function () {
	// initiates starting state
	const state = new referenceState.baseState;
	referenceController.show(state)
}

referenceController.show = function (currentState) {
	const state = currentState;
	referenceController.toggleNavButtons(state);
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
	let state = currentState;
	// Update state based on nav direction
	if (e.target.id === 'reference_nav_back'){
		state = referenceController.navBack(state);
	}else if(e.target.id === 'reference_nav_forward'){
		state = referenceController.navForward(state);
	}
	state.url = state.buildUrl(state.currentPage); 
	// console.log(`hist = ${state.pageHistory}, cur = ${state.currentPage}, for = ${state.pageForward}`)
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

referenceController.toggleNavButtons = function (currentState) {
	/* toggle buttonInactive class and button envent Listener based on 
	length of Forward and History Array */
	const state = currentState;
	const backButton = document.querySelector('#reference_nav_back');
	const forwardButton = document.querySelector('#reference_nav_forward');
	const _addListenter = function (event) {
		console.log(`this = `, this)
		referenceController.handleNav(event, state)
	}
	
	if (currentState.pageHistory.length === 0) {
		backButton.classList.add('buttonInactive');
		backButton.removeEventListener('click', _addListenter, false);
		state.backButtonListener = false;
		console.log('remove back button', state.backButtonListener)
	}else if(currentState.pageHistory.length > 0 && !state.backButtonListener ){
		backButton.classList.remove('buttonInactive');
		backButton.addEventListener('click', _addListenter, false);
		state.backButtonListener = true;
		console.log('add back button', state.backButtonListener)
	}
	console.log(state.backButtonListener, state.forwardButtonListener)

	// if (currentState.pageForward.length === 0) {
	// 	// console.log('remove forward button')
	// 	forwardButton.classList.add('buttonInactive');
	// 	forwardButton.removeEventListener('click', referenceController.handleNav);
	// }else{
	// 	// console.log('add forwardButton')
	// 	forwardButton.classList.remove('buttonInactive');
	// 	forwardButton.addEventListener('click', (e) => referenceController.handleNav(e, currentState));
	// }
}


