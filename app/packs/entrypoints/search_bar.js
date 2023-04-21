import $ from "jquery";
import "jquery-ui/ui/widgets/autocomplete";
import { OpenStreetMapProvider } from "leaflet-geosearch";

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
