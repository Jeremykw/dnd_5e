var referenceState = referenceState || {};

referenceState.baseState = function () {
	this.currentPage = 'index';
	this.lastPage = '';
	this.pageHistory = [];
	this.pageForward = [];
	this.pageType = 'list';
	this.url = '';
	this.data = referenceCategories['index'];
}

referenceState.baseState.prototype.buildUrl = function(targetId) {
	const api = 'https://cors-anywhere.herokuapp.com/http://dnd5eapi.co';
	const pageURL = ( () => {
		if (referenceCategories[this.currentPage]){
			// const target = this.data.filter( target => target.index === targetId)
			// return api + target[0].url;
			return '';
		}else{
			return `${api}/api/${this.pageType}/${targetId}`;
		}
	})();
	return pageURL;
}

referenceState.baseState.prototype.dataFactory = function(data) {
	let items = [];
	if (data.results) {
		return data.results;
	}else if (!data.isArray){
		// for (item in data) {
		// 	let temp = {};
		// 	temp[item] = data[item];
		// 	items.push(temp);
		// }
		return {...data};
	}
}

referenceState.baseState.prototype.typeOfPage = function (page) {
	const list = ['index', 'ability_scores', 'classes', 'conditions', 'damage_types', 'equipment_categories', 'languages', 'schools_of_magic', 'races', 'skills', 'spellcasting', 'spells', 'starting_equipment' ];
	const ability_and_skills = referenceCategories.showSkillsAndAbilities;
	if ( list.includes(page) ) {
		return 'list';
	}else if ( referenceCategories.showAbilitiesScores.includes(page) ) {
		return 'ability-scores';
	}else if ( referenceCategories.showSkills.includes(page) ){
		return 'skills';
	}else if ( referenceCategories.classes.filter( cls => cls.index === page ).length > 0 ){
		return 'classes';
	}
}
