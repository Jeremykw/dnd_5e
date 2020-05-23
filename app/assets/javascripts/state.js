var referenceState = referenceState || {};

referenceState.baseState = function () {
	this.currentPage = 'index';
	this.lastPage = '';
	this.pageType = 'list';
	this.url = '';
	this.data = referenceCategories['index'];
}

referenceState.baseState.prototype.buildUrl = function(targetId) {
	const api = 'https://cors-anywhere.herokuapp.com/http://dnd5eapi.co';
	const pageURL = ( () => {
		if (this.currentPage === 'index'){ // not needed ??
			// console.log('index')
			return '';
		}else{
			const target = this.data.filter( target => target.index === targetId)
			return api + target[0].url;
		}
	})();
	return pageURL;
}

referenceState.baseState.prototype.dataFactory = function(data) {
	let items = [];
	if (data.results) {
		return data.results;
	}else if (!data.isArray){
		for (item in data) {
			let temp = {};
			temp[item] = data[item];
			items.push(temp);
		}
		return items;
	}
}

referenceState.baseState.prototype.typeOfPage = function (page) {
	const list = ['index', 'ability_scores', 'classes', 'conditions', 'damage_types', 'equipment_categories', 'languages', 'schools_of_magic', 'races', 'skills', 'spellcasting', 'spells', 'starting_equipment' ];
	const ability_scores = ['cha', 'con', 'dex', 'int', 'str', 'wis']
	if ( list.includes(page) ) {
		return 'list';
	}else if ( ability_scores.includes(page) ) {
		return 'ability_scores';
	}
	
}
