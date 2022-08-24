@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}
                </div>
                </div>

                <br>
                <br>

                <div class="card">
                    <div class="card">
                    <div class="card-header">Some Map</div>
                    <div class="card-body">
                            <div id="toolbar" style="display: none;">
                              <ul>
                                <li>
                                  <a>WMS version:</a>
                                  <select id="wmsVersionSelector" onchange="setWMSVersion(value)">
                                    <option value="1.1.1">1.1.1</option>
                                    <option value="1.3.0">1.3.0</option>
                                  </select>
                                </li>
                                <li>
                                  <a>Tiling:</a>
                                  <select id="tilingModeSelector" onchange="setTileMode(value)">
                                    <option value="untiled">Single tile</option>
                                    <option value="tiled">Tiled</option>
                                  </select>
                                </li>
                                <li>
                                  <a>Antialias:</a>
                                  <select id="antialiasSelector" onchange="setAntialiasMode(value)">
                                    <option value="full">Full</option>
                                    <option value="text">Text only</option>
                                    <option value="none">Disabled</option>
                                  </select>
                                </li>
                                <li>
                                  <a>Format:</a>
                                  <select id="imageFormatSelector" onchange="setImageFormat(value)">
                                    <option value="image/png">PNG 24bit</option>
                                    <option value="image/png8">PNG 8bit</option>
                                    <option value="image/gif">GIF</option>
                                    <option id="jpeg" value="image/jpeg">JPEG</option>
                                    <option id="jpeg-png" value="image/vnd.jpeg-png">JPEG-PNG</option>
                                    <option id="jpeg-png8" value="image/vnd.jpeg-png8">JPEG-PNG8</option>
                                  </select>
                                </li>
                                <li>
                                  <a>Styles:</a>
                                  <select id="imageFormatSelector" onchange="setStyle(value)">
                                    <option value="">Default</option>
                                  </select>
                                </li>
                                <li>
                                  <a>Width/Height:</a>
                                  <select id="widthSelector" onchange="setWidth(value)">
                                     <!--
                                     These values come from a statistics of the viewable area given a certain screen area
                                     (but have been adapted a litte, simplified numbers, added some resolutions for wide screen)
                                     You can find them here: http://www.evolt.org/article/Real_World_Browser_Size_Stats_Part_II/20/2297/
                                     --><option value="auto">Auto</option>
                                        <option value="600">600</option>
                                        <option value="750">750</option>
                                        <option value="950">950</option>
                                        <option value="1000">1000</option>
                                        <option value="1200">1200</option>
                                        <option value="1400">1400</option>
                                        <option value="1600">1600</option>
                                        <option value="1900">1900</option>
                                    </select>
                                    <select id="heigthSelector" onchange="setHeight(value)">
                                        <option value="auto">Auto</option>
                                        <option value="300">300</option>
                                        <option value="400">400</option>
                                        <option value="500">500</option>
                                        <option value="600">600</option>
                                        <option value="700">700</option>
                                        <option value="800">800</option>
                                        <option value="900">900</option>
                                        <option value="1000">1000</option>
                                    </select>
                                  </li>
                                  <li>
                                      <a>Filter:</a>
                                      <select id="filterType">
                                          <option value="cql">CQL</option>
                                          <option value="ogc">OGC</option>
                                          <option value="fid">FeatureID</option>
                                      </select>
                                      <input type="text" size="80" id="filter">
                                      <a id="updateFilterButton" href="#" onclick="updateFilter()" title="Apply filter">Apply</a>
                                      <a id="resetFilterButton" href="#" onclick="resetFilter()" title="Reset filter">Reset</a>
                                  </li>
                                </ul>
                              </div>
                            <div id="map">

                              <div class="ol-toggle-options ol-unselectable">
                                <a title="Toggle options toolbar" onclick="toggleControlPanel()" href="#toggle">...</a>
                              </div>
                            
                              <div class="ol-viewport" style="position: relative; overflow: hidden; width: 100%; height: 100%; touch-action: none;">
                                <canvas class="ol-unselectable" style="width: 100%; height: 100%;" width="766" height="381"></canvas>
                                <div class="ol-overlaycontainer"></div>
                                <div class="ol-overlaycontainer-stopevent">
                                  <div class="ol-zoom ol-unselectable ol-control">
                                    <button class="ol-zoom-in" type="button" title="Zoom in">+</button>
                                    <button class="ol-zoom-out" type="button" title="Zoom out">−</button>
                                  </div>
                                  <div class="ol-rotate ol-unselectable ol-control ol-hidden">
                                    <button class="ol-rotate-reset" type="button" title="Reset rotation">
                                      <span class="ol-compass" style="transform: rotate(0rad);">⇧</span>
                                    </button>
                                  </div>
                                </div>
                              </div>
                              
                            </div>

                            <div id="wrapper">
                                <div id="location"><div class="custom-mouse-position">&nbsp;</div>
                                  <div class="custom-mouse-position">&nbsp;</div>
                                </div>
                                <div id="scale">Scale = 1 : 279M</div>
                            
                              <div id="nodelist">
                                  <em>Click on the map to get feature info</em>
                              </div>

                              <script type="text/javascript">
                                var pureCoverage = false;
                                // if this is just a coverage or a group of them, disable a few items,
                                // and default to jpeg format
                                var format = 'image/png';
                                var bounds = [-180.00001525878906, -90,
                                              180.00332641601562, 90.00000762939453];
                                if (pureCoverage) {
                                  document.getElementById('antialiasSelector').disabled = true;
                                  document.getElementById('jpeg').selected = true;
                                  format = "image/jpeg";
                                }

                                var supportsFiltering = true;
                                if (!supportsFiltering) {
                                  document.getElementById('filterType').disabled = true;
                                  document.getElementById('filter').disabled = true;
                                  document.getElementById('updateFilterButton').disabled = true;
                                  document.getElementById('resetFilterButton').disabled = true;
                                }

                                var mousePositionControl = new ol.control.MousePosition({
                                  className: 'custom-mouse-position',
                                  target: document.getElementById('location'),
                                  coordinateFormat: ol.coordinate.createStringXY(5),
                                  undefinedHTML: '&nbsp;'
                                });
                                var untiled = new ol.layer.Image({
                                  source: new ol.source.ImageWMS({
                                    ratio: 1,
                                    url: 'http://35.176.109.221:8080/geoserver/cpen412_project2/wms',
                                    params: {'FORMAT': format,
                                             'VERSION': '1.1.1',  
                                          "STYLES": '',
                                          "LAYERS": 'cpen412_project2:ne_group',
                                          "exceptions": 'application/vnd.ogc.se_inimage',
                                    }
                                  })
                                });
                                var tiled = new ol.layer.Tile({
                                  visible: false,
                                  source: new ol.source.TileWMS({
                                    url: 'http://35.176.109.221:8080/geoserver/cpen412_project2/wms',
                                    params: {'FORMAT': format, 
                                             'VERSION': '1.1.1',
                                             tiled: true,
                                          "STYLES": '',
                                          "LAYERS": 'cpen412_project2:ne_group',
                                          "exceptions": 'application/vnd.ogc.se_inimage',
                                       tilesOrigin: -180.00001525878906 + "," + -90
                                    }
                                  })
                                });
                                var projection = new ol.proj.Projection({
                                    code: 'EPSG:4326',
                                    units: 'degrees',
                                    axisOrientation: 'neu',
                                    global: true
                                });
                                var map = new ol.Map({
                                  controls: ol.control.defaults({
                                    attribution: false
                                  }).extend([mousePositionControl]),
                                  target: 'map',
                                  layers: [
                                    untiled,
                                    tiled
                                  ],
                                  view: new ol.View({
                                     projection: projection
                                  })
                                });
                                map.getView().on('change:resolution', function(evt) {
                                  var resolution = evt.target.get('resolution');
                                  var units = map.getView().getProjection().getUnits();
                                  var dpi = 25.4 / 0.28;
                                  var mpu = ol.proj.METERS_PER_UNIT[units];
                                  var scale = resolution * mpu * 39.37 * dpi;
                                  if (scale >= 9500 && scale <= 950000) {
                                    scale = Math.round(scale / 1000) + "K";
                                  } else if (scale >= 950000) {
                                    scale = Math.round(scale / 1000000) + "M";
                                  } else {
                                    scale = Math.round(scale);
                                  }
                                  document.getElementById('scale').innerHTML = "Scale = 1 : " + scale;
                                });
                                map.getView().fit(bounds, map.getSize());
                                map.on('singleclick', function(evt) {
                                  document.getElementById('nodelist').innerHTML = "Loading... please wait...";
                                  var view = map.getView();
                                  var viewResolution = view.getResolution();
                                  var source = untiled.get('visible') ? untiled.getSource() : tiled.getSource();
                                  var url = source.getGetFeatureInfoUrl(
                                    evt.coordinate, viewResolution, view.getProjection(),
                                    {'INFO_FORMAT': 'text/html', 'FEATURE_COUNT': 50});
                                  if (url) {
                                    document.getElementById('nodelist').innerHTML = '<iframe seamless src="' + url + '"></iframe>';
                                  }
                                });

                                // sets the chosen WMS version
                                function setWMSVersion(wmsVersion) {
                                  map.getLayers().forEach(function(lyr) {
                                    lyr.getSource().updateParams({'VERSION': wmsVersion});
                                  });
                                  if(wmsVersion == "1.3.0") {
                                      origin = bounds[1] + ',' + bounds[0];
                                  } else {
                                      origin = bounds[0] + ',' + bounds[1];
                                  }
                                  tiled.getSource().updateParams({'tilesOrigin': origin});
                                }

                                // Tiling mode, can be 'tiled' or 'untiled'
                                function setTileMode(tilingMode) {
                                  if (tilingMode == 'tiled') {
                                    untiled.set('visible', false);
                                    tiled.set('visible', true);
                                  } else {
                                    tiled.set('visible', false);
                                    untiled.set('visible', true);
                                  }
                                }

                                function setAntialiasMode(mode) {
                                  map.getLayers().forEach(function(lyr) {
                                    lyr.getSource().updateParams({'FORMAT_OPTIONS': 'antialias:' + mode});
                                  });
                                }

                                // changes the current tile format
                                function setImageFormat(mime) {
                                  map.getLayers().forEach(function(lyr) {
                                    lyr.getSource().updateParams({'FORMAT': mime});
                                  });
                                }

                                function setStyle(style){
                                  map.getLayers().forEach(function(lyr) {
                                    lyr.getSource().updateParams({'STYLES': style});
                                  });
                                }

                                function setWidth(size){
                                  var mapDiv = document.getElementById('map');
                                  var wrapper = document.getElementById('wrapper');

                                  if (size == "auto") {
                                    // reset back to the default value
                                    mapDiv.style.width = null;
                                    wrapper.style.width = null;
                                  }
                                  else {
                                    mapDiv.style.width = size + "px";
                                    wrapper.style.width = size + "px";
                                  }
                                  // notify OL that we changed the size of the map div
                                  map.updateSize();
                                }

                                function setHeight(size){
                                  var mapDiv = document.getElementById('map');
                                  if (size == "auto") {
                                    // reset back to the default value
                                    mapDiv.style.height = null;
                                  }
                                  else {
                                    mapDiv.style.height = size + "px";
                                  }
                                  // notify OL that we changed the size of the map div
                                  map.updateSize();
                                }

                                function updateFilter(){
                                  if (!supportsFiltering) {
                                    return;
                                  }
                                  var filterType = document.getElementById('filterType').value;
                                  var filter = document.getElementById('filter').value;
                                  // by default, reset all filters
                                  var filterParams = {
                                    'FILTER': null,
                                    'CQL_FILTER': null,
                                    'FEATUREID': null
                                  };
                                  if (filter.replace(/^\s\s*/, '').replace(/\s\s*$/, '') != "") {
                                    if (filterType == "cql") {
                                      filterParams["CQL_FILTER"] = filter;
                                    }
                                    if (filterType == "ogc") {
                                      filterParams["FILTER"] = filter;
                                    }
                                    if (filterType == "fid")
                                      filterParams["FEATUREID"] = filter;
                                    }
                                    // merge the new filter definitions
                                    map.getLayers().forEach(function(lyr) {
                                      lyr.getSource().updateParams(filterParams);
                                    });
                                  }

                                  function resetFilter() {
                                    if (!supportsFiltering) {
                                      return;
                                    }
                                    document.getElementById('filter').value = "";
                                    updateFilter();
                                  }

                                  // shows/hide the control panel
                                  function toggleControlPanel(){
                                    var toolbar = document.getElementById("toolbar");
                                    if (toolbar.style.display == "none") {
                                      toolbar.style.display = "block";
                                    }
                                    else {
                                      toolbar.style.display = "none";
                                    }
                                    map.updateSize()
                                  }
                              </script>
                        </div>
                        <div id="save-code-popup-parent"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
