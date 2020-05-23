var referenceView = referenceView || {};


referenceView.draw = (currentState) => {
	const state = currentState;
	const element = document.querySelector('.reference'); 
	element.innerHTML = ''; // clear div
	// add elements to parent div based on state.pageType
	switch (state.pageType) {
		case 'ability_scores':
			referenceView.drawAbility_scores(state, element);
			break;
		case 'list':
			referenceView.drawList(state, element);
			break;
	}

}

referenceView.drawAbility_scores = function (currentState, element) {
	const data = currentState.data;
	console.log(data)
	const div = document.createElement('div');
	div.classList.add('show');
	div.id = data[1].index;
	element.innerHTML = data[4].desc;


}

referenceView.drawList = function (currentState, element) {
	const data = currentState.data;
	data.forEach(item => {
		const div = document.createElement('div');
		div.innerHTML = item.name;
		div.classList.add('show');
		div.id = `${item.index}`;
		div.addEventListener('click', (e) => {
			referenceController.update(e, currentState);
		} )
		element.appendChild(div);
	})
}