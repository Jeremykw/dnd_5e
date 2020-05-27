var referenceView = referenceView || {};


referenceView.draw = (currentState) => {
	const state = currentState;
	const element = document.querySelector('.reference');

	// TODO
	// display and hide nav buttons based on length of forward and history Array
	// elseware - controle forward array


	const backButton = document.querySelector('#') 
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
		default:
			referenceView.drawList(state, element);
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

referenceView.initNav = function (currentState) {
	// add event listeners to nav Buttons
	const state = currentState;
	const navBack = document.querySelector('#reference_nav_back');
	const navForward = document.querySelector('#reference_nav_forward');
	navBack.addEventListener('click', (e) => referenceController.handleNav(e, state))
	navForward.addEventListener('click', (e) => referenceController.handleNav(e, state));
}