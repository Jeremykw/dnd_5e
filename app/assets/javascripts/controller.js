var referenceController = referenceController || {};

referenceController.init = function() {
    // initiates starting state
    const state = new referenceState.baseState;
    referenceView.addEvents(state);
    referenceController.show(state);
}

referenceController.show = function(currentState) {
    const state = currentState;
    referenceView.toggleNavButtons(state);
    if (referenceCategories[state.currentPage.index]) { // if their is a stub in referenceCategories
        state.data = referenceCategories[state.currentPage.index];
        referenceView.draw(state);
    } else {
        fetch(state.url)
            .then(response => response.json())
            .then(data => {
                state.data = state.dataFactory(data); // assign data to results
                if (state.data.equipment_category) {
                    state.pageType = state.data.equipment_category
                    	.toLowerCase()
                    	.split(' ')
                    	.join('_');
                }
                referenceView.draw(state); // pass state to viewDraw
            })
            .catch(err => console.log(`their was an error with with the network conection: ${err}`));
    }
}

referenceController.update = function(e, currentState) {
    // update state based on event
    const state = currentState;
    const target = e.target;
    state.pageHistory.push(state.currentPage)
    state.pageForward = [];
    state.currentPage = {
        index: target.id,
        url: target.dataset.url
    }
    referenceController.loadPage(state);
}


referenceController.loadPage = function(currentState) {
    const state = currentState
    state.updateState();
    referenceController.show(state);
}

referenceController.handleNav = function(e, currentState) {
    let state = currentState;
    // Update state based on nav direction
    if (e.target.id === 'reference_nav_back' && state.pageHistory[0]) {
        state = referenceController.navBack(state);
    } else if (e.target.id === 'reference_nav_forward' && state.pageForward[0]) {
        state = referenceController.navForward(state);
    }
    referenceController.loadPage(state);
}
referenceController.navBack = function(currentState) {
    const state = currentState;
    state.pageForward.push(state.currentPage); //add current page to the forward list
    state.currentPage = state.pageHistory[state.pageHistory.length - 1]; // assign last page in history to current page
    state.pageHistory.pop(); // remove new current page from history
    state.pageType = state.typeOfPage(state.currentPage);
    return state;
}

referenceController.navForward = function(currentState) {
    const state = currentState;
    state.pageHistory.push(state.currentPage);
    state.currentPage = state.pageForward[state.pageForward.length - 1];
    state.pageForward.pop();
    state.pageType = state.typeOfPage(state.currentPage);
    return state;
}