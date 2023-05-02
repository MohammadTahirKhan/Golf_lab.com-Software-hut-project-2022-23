/**
 * Contains miscellaneous scripts for various aspects of the site.
 */

import $ from "jquery";
import "jquery-ui/ui/widgets/autocomplete";
import { OpenStreetMapProvider } from "leaflet-geosearch";

/**
 * Provides autocomplete functionality for an input with the id "searchbar".
 * Search results are provided by the OpenStreetMapProvider.
 * @return {SearchResult[]} An array of search results.
 */
$("#searchbar").autocomplete({
  async source(request, response) {
    const providerform = new OpenStreetMapProvider({
      params: {
        limit: 5,
      },
    });

    const results = await providerform.search({ query: request.term });
    response(results);
  },
  delay: 100,
  minLength: 1,
});

/**
 * Removes a flash message from the DOM when clicked on
 * @return {void}
 */
const removeFlashMsg = () => {
  const flashMsg = document.querySelector(".alert");
  flashMsg.remove();
};

export { removeFlashMsg };
