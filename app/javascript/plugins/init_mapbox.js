import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });


  const markers = JSON.parse(mapElement.dataset.markers);
    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .addTo(map);
  };


  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 50, duration: 0 });
  };

    fitMapToMarkers(map, markers);
    }
  ;

export { initMapbox };
