var referenceState = referenceState || {};

referenceState.baseState = function () {
	this.currentPage = 'index';
	this.lastPage = '';
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

// referenceState.baseState.prototype.dataFactory = function() {
// 	const data = this.data;
// 	let items = [];
// 	if (this.currentPage !== 'index') {
// 		items = this.data.results;
// 	}else{
// 		items = referenceCategories.index;
// 	}


// 	// for (item in data) {
// 	// 	let temp = {};
// 	// 	temp[item] = data[item];
// 	// 	items.push(temp);
// 	// }
// 	return items;
// }
