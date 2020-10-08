'use strict';

const serverPath = 'http://localhost:8081/api/places';

const getCurrentPage = () => {
    const loc = (typeof window.location !== 'string') ? window.location.search : window.location;
    const index = loc.indexOf('page=');
    return index === -1 ? 1 : parseInt(loc[index + 5]) + 1;
};

const constructGetUrl = (url, queryParams) => {
    for (let key in queryParams) {
        if (queryParams.hasOwnProperty(key)) {
            console.log(key, queryParams[key]);
        }
    }
    // TODO
};

(function loadPlacesPageable() {

    const placeTemplate = (listItem) => {
        const template = `
<div class="col mb-4">
                    <div class="card h-100  text-center">
                       
                        <img src="/img/${listItem.imagePath}" class=" card-i" alt="...">
                  
                        <div class="card-body" >
                            <h5 class="card-title">${listItem.name}</h5>
                            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <a href="http://localhost:8081/places/${listItem.id}" class="btn btn-primary" >Open</a>
                        </div>
                    </div>
                </div>
        `;

        const elem = document.createElement('div');
        elem.innerHTML = template.trim();

        // return inner div with classes flex etc
        return elem.children[0];
    };

    const fetchPlaces = async (page, size) => {
        const placesPath = `${serverPath}/?page=${page}&size=${size}`;
        const data = await fetch(placesPath, {cache: 'no-cache'});
        // console.log(data.json());
        return data.json();
    };

    const loadNextPlacesGenerator = (loadNextElement, page) => {
        return async (event) => {
            event.preventDefault();
            event.stopPropagation();

            const defaultPageSize = loadNextElement.getAttribute('data-default-page-size');
            const data = await fetchPlaces(page, defaultPageSize);

            loadNextElement.hidden = data.length === 0;
            if (data.length === 0) {
                return;
            }

            const list = document.getElementById('itemList');
            for (let item of data) {
                list.append(placeTemplate(item));
            }

            loadNextElement.addEventListener('click', loadNextPlacesGenerator(loadNextElement, page + 1), {once: true});
            window.scrollTo(0, document.body.scrollHeight);
        };
    };
    document.getElementById('loadPrev').hidden = true;

    const loadNextElement = document.getElementById('loadNext');
    if (loadNextElement !== null) {
        loadNextElement.innerText = "Load more places";
        loadNextElement.addEventListener('click', loadNextPlacesGenerator(loadNextElement, getCurrentPage()), {once: true});
    }

})();

//
// const formSearchForm = document.getElementById('formSearch');
//
// function formSearchHandler(e){
//
//     e.preventDefault();
//
//     const form = e.target;
//     // console.log(form[0].name);
//     const data = new FormData(form);
//     const n = data.get('name');
//     if (n == undefined || n == ""){
//         alert("Строка не может быть пустой");
//     }
//     fetchAsync(n);
//
//
//
// }
// formSearchForm.addEventListener('submit', formSearchHandler);

//=====================================================


