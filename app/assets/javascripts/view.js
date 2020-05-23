var referenceView = referenceView || {};


referenceView.draw = (state) => {
	const element = document.querySelector('.reference');
	element.innerHTML = '';
	state.data.forEach(item => {
		const div = document.createElement('div');
		div.innerHTML = item.name;
		div.classList.add('show');
		div.id = `${item.index}`;
		div.addEventListener('click', (e) => {
			referenceController.update(e, state);
		} )
		element.appendChild(div);
	})
}