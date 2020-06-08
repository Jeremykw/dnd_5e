var referenceView = referenceView || {};


referenceView.draw = (currentState) => {
    const state = currentState;
    const element = document.querySelector('.reference');
    element.innerHTML = ''; // clear div
    // add elements to parent div based on state.pageType
    const simplePages = ['tools', 'spells', 'ability-scores', 'skills', 'conditions', 'damage-types', 'languages']
    if (simplePages.includes(state.pageType)) {
        referenceView.drawSimpleList(state, element);
        return;
    }
    switch (state.pageType) {
        // case 'weapon':
        //     referenceView.drawWeapon(state, element)
        //     break;
        case 'adventuring_gear':
            referenceView.drawAdventuringGear(state, element);
            break;
        case 'armor':
            referenceView.drawArmor(state, element);
            break;
        case 'equipment-categories':
            referenceView.drawEquipmentList(state, element);
            break;
        // case 'classes':
        //     referenceView.drawClass(state, element);
        //     break;
        case 'list':
            referenceView.drawList(state, state.data, element);
            break;
        default:
            referenceView.drawNotice(state, element)

    }
}

referenceView.drawNotice = function(currentState, element) {
	const state = currentState;
    const data = state.data;
    const noticeDiv = document.createElement('div');
    noticeDiv.innerHTML = `<h2>This app is a work in progress. If you're reading this, the information you're looking for is not available yet. I have deployed the content reference feature in an unfinished state so that I can demonstrate the work I have completed while I spend time getting familiar with a new technology. I have been curious about the React framework for a while now and I believe it will help me going forward with this project. I will use the React framework to finish this feature and deploy it soon.</h2>`;
    element.appendChild(noticeDiv);
}

referenceView.drawWeapon = function(currentState, element) {
    const state = currentState;
    const data = state.data;
    const weaponDiv = document.createElement('div');
    weaponDiv.innerHTML = `<h2>${data.index}</h2>`;
    element.appendChild(weaponDiv);

}
referenceView.drawAdventuringGear = function(currentState, element) {
    const state = currentState;
    const data = state.data;
    const adventuringGearDiv = document.createElement('div');
    adventuringGearDiv.classList.add('gear');
    adventuringGearDiv.innerHTML = `
		<h2>${ data.full_name || data.name }</h2>
		<div class="gearLt itemBackground">
			<b>Cost: </b>${data.cost.quantity}${data.cost.unit}</br>
			<b>Weght: </b>${data.weight ? `${data.weight}lb` : `--`}</br>
			<b>Category: </b>${data.gear_category}</br>
		</div>
	`;
    data.contents ? adventuringGearDiv.appendChild(referenceView.drawPack(data.contents, state)) : '';
    data.desc ? adventuringGearDiv.appendChild(referenceView.addDesc(data.desc)) : '';
    element.appendChild(adventuringGearDiv);
}

referenceView.addDesc = function(desc) {
    const descDiv = document.createElement('div');
    descDiv.classList.add('gearDesc');
    descDiv.innerHTML = desc;
    return descDiv;
}
referenceView.drawPack = function(contents, currentState) {
    // List items that are in Equipment packs
    const contentDiv = document.createElement('div');
    contentDiv.classList.add('gear');
    contentDiv.classList.add('gearPackRt');
    contentDiv.classList.add('itemBackground');
    const regex = new RegExp('([^\/]+$)', 'gi');
    contents.forEach(item => {
        const packItemDiv = document.createElement('span');
        let packItem = item.item_url.match(regex, '')[0]
            .split('-')
            .join(' ')
            .toUpperCase();
        packItemDiv.dataset.url = item.item_url;
        packItemDiv.innerHTML = packItem;
        packItemDiv.addEventListener('click', (e) => referenceController.update(e, currentState));
        contentDiv.appendChild(packItemDiv);
    });
    return contentDiv;
}

referenceView.drawArmor = function(currentState, element) {
    const armorDiv = document.createElement('div');
    const data = currentState.data
    armorDiv.classList.add('gear')
    armorDiv.innerHTML = `
		<h2>${ data.full_name || data.name } Armor</h2>
		<div class="gearLt itemBackground">
			<b>Cost: </b>${data.cost.quantity}${data.cost.unit}</br>
			<b>Weght: </b>${data.weight}lb</br>
			<b>Category: </b>${data.armor_category}</br>
		</div>
		<div class ="gearRt itemBackground">
			<b>Armor Class: </b>${data.armor_class.base}
						 ${data.armor_class.dex_bonus ? ' + Dex modifier' : ''}
						 ${data.armor_class.max_bonus ? '(max 2)' : ''}</br>
			<b>Effects on Stealth: </b>${data.stealth_disadvantage ? '--' : 'Disadvantage'}</br>
			<b>Strength Minimum: </b>${data.str_minimum ? `${data.str_minimum}` : '--'}
		</div>
	`;
    element.appendChild(armorDiv);
}
referenceView.drawEquipmentList = function(currentState, element) {
    const equipmentTitle = document.createElement('div');
    equipmentTitle.innerHTML = `<h1>${currentState.data.name}</h1>`;
    equipmentTitle.classList.add('equipment_title');
    element.appendChild(equipmentTitle);
    referenceView.drawList(currentState, currentState.data.equipment, element);
}

referenceView.drawClass = function(currentState, element) {
    console.log('class_data = ', currentState.data)
    const state = currentState;
    const data = currentState.data;
    const div = document.createElement('div');
    div.classList.add('ability_score');
    div.id = data.index;
    div.innerHTML = `<h2>${ data.full_name || data.name }</h2>`;
    element.appendChild(div);
}

referenceView.drawSimpleList = function(currentState, element) {
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

referenceView.listSkills = function(skills, state) {
    // Draws the list of skills if present 
    const skillsDiv = document.createElement('div');
    skillsDiv.innerHTML = '<h4>Related Skills</h2>'
    const regex = new RegExp('([^\/]+$)', 'gi');
    if (skills) {
        skills.forEach(skill => {
            const skillLink = document.createElement('span');
            skillLink.innerHTML = `${skill.name}, `;
            skillLink.id = skill.url.match(regex, '');
            skillLink.dataset.url = skill.url;
            skillLink.classList.add('hover');
            skillLink.addEventListener('click', (e) => referenceController.update(e, state));
            skillsDiv.appendChild(skillLink);
        })
    }
    return skillsDiv;
}


referenceView.drawList = function(currentState, data, element) {
    // Draws page with listed items onlye
    // const regex = new RegExp('([^\/]+$)', 'gi');
    if (Array.isArray(data)) {
        data.forEach(item => {
            const div = document.createElement('div');
            div.innerHTML = item.name || item;
            div.classList.add('show');
            div.id = item.index || item.name || item;
            div.dataset.url = item.url;
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


referenceView.toggleNavButtons = function(currentState) {
    /* toggle buttonInactive class and button envent Listener based on 
    length of Forward and History Array */
    const state = currentState;
    const backButton = document.querySelector('#reference_nav_back');
    const forwardButton = document.querySelector('#reference_nav_forward');

    // toggle back button
    if (state.pageHistory.length === 0) {
        backButton.classList.add('buttonInactive');
    } else {
        backButton.classList.remove('buttonInactive');
    }
    // toggle forward button
    if (state.pageForward.length === 0) {
        forwardButton.classList.add('buttonInactive');
    } else {
        forwardButton.classList.remove('buttonInactive');
    }
}