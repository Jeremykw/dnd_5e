var referenceView = referenceView || {};


referenceView.draw = (currentState) => {
	const state = currentState;
	const element = document.querySelector('.reference');
	element.innerHTML = ''; // clear div
	// add elements to parent div based on state.pageType
	switch (state.pageType) {
		case 'ability-scores':
			referenceView.drawAbilityAndSkills(state, element);
			break;
		case 'skills':
			referenceView.drawAbilityAndSkills(state, element);
			break;
		case 'classes':
			referenceView.drawClasses(state, element);
			break;
		case 'list':
			if (true){
				referenceView.drawList(state, element);
			}
	}

}

referenceView.drawClasses = function (currentState, element) {
	console.log('class_data = ', currentState.data)
	const state = currentState;
	const data = currentState.data;
	const div = document.createElement('div');
	div.classList.add('ability_score');
	div.id = data.index;
	div.innerHTML = `<h2>${ data.full_name || data.name }</h2>`;
}

referenceView.drawAbilityAndSkills = function (currentState, element) {
	const state = currentState;
	const data = currentState.data;
	const div = document.createElement('div');
	div.classList.add('ability_score');
	div.id = data.index;
	div.innerHTML = `
		<h2>${ data.full_name || data.name }</h2>
		<p>${ data.desc }</p>
		`;
	data.skills ? div.appendChild(referenceView.listSkills(data.skills, state)) : 1;
	element.appendChild(div);

}

referenceView.listSkills = function (skills, state) {
	// Draws the list of skills if present 
	const skillsDiv = document.createElement('div');
	skillsDiv.innerHTML = '<h4>Related Skills</h2>'
	const regex = new RegExp('([^\/]+$)', 'gi')
	if (skills){
		skills.forEach(skill => {
			const skillLink = document.createElement('span');
			skillLink.innerHTML = `${skill.name}, `;
			skillLink.id = skill.url.match(regex, '');
			skillLink.classList.add('hover');
			skillLink.addEventListener('click', (e) => referenceController.update(e, state));
			skillsDiv.appendChild(skillLink);
		})}
	return skillsDiv;
}


referenceView.drawList = function (currentState, element) {
	// Draws page with listed items onlye
	console.log('tried to draw list')
	const data = currentState.data;

	if (Array.isArray(data)) {
		data.forEach(item => {
			const div = document.createElement('div');
			div.innerHTML = item.name || item;
			div.classList.add('show');
			div.id = `${ item.index || item }`;
			div.addEventListener('click', (e) => referenceController.update(e, currentState))
			element.appendChild(div);
		})
	}
}

referenceView.addEvents = function(currentState) {
	const backButton = document.querySelector('#reference_nav_back');
	const forwardButton = document.querySelector('#reference_nav_forward');
	backButton.addEventListener('click', 
		(e) => referenceController.handleNav(e, currentState));
	forwardButton.addEventListener('click', 
		(e) => referenceController.handleNav(e, currentState));
}


referenceView.toggleNavButtons = function (currentState) {
	/* toggle buttonInactive class and button envent Listener based on 
	length of Forward and History Array */
	const state = currentState;
	const backButton = document.querySelector('#reference_nav_back');
	const forwardButton = document.querySelector('#reference_nav_forward');
	// toggle back button
	if ( state.pageHistory.length === 0 ) {
		backButton.classList.add('buttonInactive');
	}else {
		backButton.classList.remove('buttonInactive');
	}
	// toggle forward button
	if ( state.pageForward.length === 0 ) {
		forwardButton.classList.add('buttonInactive');
	}else {
		forwardButton.classList.remove('buttonInactive');
	}
}














