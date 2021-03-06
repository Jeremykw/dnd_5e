var referenceState = referenceState || {};

referenceState.baseState = function() {
    this.currentPage = { index: 'index', url: "" };
    this.pageHistory = [];
    this.pageForward = [];
    this.pageType = 'list';
    this.data = referenceCategories['index'];
}

referenceState.baseState.prototype.updateState = function() {
    // build URL and set pageType
    // a proxy was needed to avoid cors issues when making the get request
    // between browsers
    const api = 'https://dnd5eapi.co';
    const proxy = 'https://secure-ravine-36293.herokuapp.com/';
    this.pageType = this.typeOfPage(this.currentPage.index, this) || '';
    if (referenceCategories[this.currentPage.index]) {
        this.url = '';
    } else {
    	// conbine proxy, api and current page url into url
        this.url = `${proxy}${api}${this.currentPage.url}`;
    }
}

referenceState.baseState.prototype.dataFactory = function(data) {
    // flatens data into a more predictable result
    let items = [];
    if (data.results) {
        return data.results;
    } else if (!data.isArray) {
        return { ...data };
    }
}

referenceState.baseState.prototype.typeOfPage = function(page) {
    // Sets page type for use in referenceView
    // admittedly this fuction needs refactoring
    const list = ['index', 'ability-scores', 'classes', 'conditions', 'damage-types', 'equipment-categories', 'languages', 'schools-of-magic', 'races', 'skills', 'spellcasting', 'spells'];
    const equipmentCategories = referenceCategories['equipment-categories'].map(category => category.index);
    if (list.includes(page)) {
        return 'list';
    } else if (referenceCategories['ability-scores'].filter(cls => cls.index === page).length > 0) {
        return 'ability-scores';
    } else if (referenceCategories.skills.filter(cls => cls.index === page).length > 0) {
        return 'skills';
    } else if (referenceCategories.classes.filter(cls => cls.index === page).length > 0) {
        return 'classes';
    } else if (referenceCategories.conditions.filter(cls => cls.index === page).length > 0) {
        return 'conditions';
    } else if (referenceCategories['damage-types'].filter(cls => cls.index === page).length > 0) {
        return 'damage-types';
    } else if (referenceCategories['languages'].filter(cls => cls.index === page).length > 0) {
        return 'languages';
    } else if (referenceCategories['schools-of-magic'].filter(cls => cls.index === page).length > 0) {
        return 'schools-of-magic';
    } else if (referenceCategories['spells'].filter(cls => cls.index === page).length > 0) {
        return 'spells';
    } else if (equipmentCategories.includes(page)) {
        return `equipment-categories`;
    } else {
        return '';
    }
}