var autoApp = {
    paginationHome: 0,
    linkAutoCar:"/auto/car/",
    selectors: [
        '#formResultsContent'
    ],
    elms: {},
    form: {
        form: $('#autoForm'),
        autoSendButton: $('#autoSendButton'),
        type: $('#autoType'),
        all: $('#autoAll'),
        new: $('#autoNew'),
        mileage: $('#autoMileage'),
        mark: $('#autoMark'),
        model: $('#autoModel'),
        generation: $('#autoGeneration'),
        carcase: $('#autoCarcase'),
        transmission: $('#autoTransmission'),
        fuel: $('#autoFuel'),
        driveUnit: $('#autoDriveUnit'),
        searchParameters: {},
        searchHelperParameters: {},
        paginationSearch: 0,
        event: {
            mark: function(t, v) {
                if (v === 0) {
                    delete autoApp.form.searchParameters.markId;
                    delete autoApp.form.searchHelperParameters.markId;
                } else {
                    autoApp.form.searchParameters.markId = v;
                    autoApp.form.searchHelperParameters.markId = v;
                }

                delete autoApp.form.searchParameters.modelId;
                delete autoApp.form.searchParameters.generationId;
                delete autoApp.form.searchHelperParameters.modelId;

                return {
                    send: {
                        searchHelperParameters: autoApp.form.searchHelperParameters,
                    },
                    callback: autoApp.form.render.optionSelectModel
                };
            },
            model: function(t, v) {
                if (v === 0) {
                    delete autoApp.form.searchParameters.modelId;
                    delete autoApp.form.searchHelperParameters.modelId;
                } else {
                    autoApp.form.searchParameters.modelId = v;
                    autoApp.form.searchHelperParameters.modelId = v;
                }

                delete autoApp.form.searchParameters.generationId;
                delete autoApp.form.searchHelperParameters.markId;

                return {
                    send: {
                        searchHelperParameters: autoApp.form.searchHelperParameters,
                    },
                    callback: autoApp.form.render.optionSelectGeneration
                };
            },
            generation: function(t, v) {
                if (v === 0) delete autoApp.form.searchParameters.generationId;
                else autoApp.form.searchParameters.generationId = v;
            },
            carcase: function (t, v) {
                if (v === 0) delete autoApp.form.searchParameters.carcaseId;
                else autoApp.form.searchParameters.carcaseId = v;
            },
            transmission: function (t, v) {
                if (v === 0) delete autoApp.form.searchParameters.transmissionId;
                else autoApp.form.searchParameters.transmissionId = v;
            },
            fuel: function (t, v) {
                if (v === 0) delete autoApp.form.searchParameters.fuelId;
                else autoApp.form.searchParameters.fuelId = v;
            },
            driveUnit: function (t, v) {
                if (v === 0) delete autoApp.form.searchParameters.driveUnitId;
                else autoApp.form.searchParameters.driveUnitId = v;
            },
        },
        render: {
            buttonAutoType: function(d, target) {
                if (d.autoType !== 'changed') return;

                var formTypes = autoApp.form.type.children();

                for (var i = 0; i < formTypes.length; i++) {
                    var type = $(formTypes[i]);

                    if ( type.hasClass('active') ) type.removeClass('active');
                }

                target.addClass('active');
            },
            optionSelectModel: function(d) {
                autoApp.form.model.html('<option value="0">Модель</option>');
                autoApp.form.generation.html('<option value="0">Поколение</option>');
                autoApp.form.generation.attr('disabled', '');

                if( $.isEmptyObject(d) ) {
                    autoApp.form.model.attr('disabled', '');
                    return;
                }

                autoApp.form.model.removeAttr('disabled');

                for (var i = 0; i < d.length; i++) {
                    autoApp.form.model
                        .append(
                            $('<option value="' + d[i].id + '">' + d[i].name + '</option>')
                        )
                }
            },
            optionSelectGeneration: function(d) {
                autoApp.form.generation.html('<option value="0">Поколение</option>');

                if( $.isEmptyObject(d) ) {
                    autoApp.form.generation.attr('disabled', '');
                    return;
                }

                autoApp.form.generation.removeAttr('disabled');

                for (var i = 0; i < d.length; i++) {
                    autoApp.form.generation
                        .append(
                            $('<option value="' + d[i].id + '">' + d[i].name + '</option>')
                        )
                }
            },
            buttonCountCars: function(d) {
                (!$.isEmptyObject(d) && d.length) ? d = d[0].cars : d = '';
                autoApp.form.autoSendButton.text("Показать " + d + " предложений");
            }
        },
    },
    render: {
        carPreviewM: function(d) {
            var parent = $('.cardsjs');

            for (var i = 0; i < d.length; i++) {
                var elm =
                    $('<div data-id=' + d[i].id + ' class="card car-preview-m">')
                        .append(
                            $('<img src="/auto/img/01ee131da18c61659313e0f772485b6e.webp" class="card-img-top" alt="...">')
                        )
                        .append(
                            $('<div class="car-region">' + d[i].region + '</div>')
                        )
                        .append(
                            $('<div class="card-body text-center">')
                                .append(
                                    $('<h5 class="card-title">' + d[i].price + 'C</h5>')
                                )
                                .append(
                                    $('<p class="card-text">' + d[i].title + '</p>')
                                )
                        )
                        .append(
                            $('<div class="card-footer text-center">')
                                .append(
                                    $('<small class="text-muted">' + d[i].dateAdd + '</small>')
                                )
                        )
                        .hide();

                autoApp.link.carPreviewM(elm);
                parent.append(elm);
                elm.slideDown(200);
            }
        },
        carPreviewL: function(d) {
            var cars = $('<div class="cars-l my-4">'),
                fragment = $( document.createDocumentFragment() );

            d.forEach(function(data) {
                fragment.append(
                    $('<div class="car-preview-l">')
                        .append(
                            $('<div class="row">')
                                .append(
                                    $('<div class="col-lg-3 col-md-4 col-sm-4 col-4">')
                                        .append(
                                            $('<div class="d-flex align-items-center h-100">')
                                                .append(
                                                    $('<img src="/auto/img/01ee131da18c61659313e0f772485b6e.webp" class="card-img-top" alt="...">')
                                                )
                                        )
                                )
                                .append(
                                    $('<div class="col-lg-9 col-md-8 col-sm-8 col-8">')
                                        .append(
                                            $('<div class="d-flex flex-column h-100">')
                                                .append(
                                                    $('<div class="row no-gutters">')
                                                        .append(
                                                            $('<div class="col-sm-auto col-6 pr-2 mr-auto">')
                                                                .append(
                                                                    $('<h5>' + data.title + '</h5>')
                                                                )
                                                        )
                                                        .append(
                                                            $('<div class="col-sm-auto col-6 pr-2 mr-auto">')
                                                                .append(
                                                                    $('<h5>' + data.price + '<small class="text-muted"> C</small>' + '</h5>')
                                                                )
                                                        )
                                                        .append(
                                                            $('<div class="col-sm-auto col-6 pr-2 mr-auto">')
                                                                .append(
                                                                    $('<h5>' + data.year_issue + '</h5>')
                                                                )
                                                        )
                                                        .append(
                                                            $('<div class="col-sm-auto col-6 pr-2 mr-auto">')
                                                                .append(
                                                                    $('<h5>' + data.mileage + '<small class="text-muted"> км</small>' + '</h5>')
                                                                )
                                                        )
                                                )
                                                .append(
                                                    $('<div class="row no-gutters">')
                                                        .append(
                                                            $('<div class="col-6 pr-2">')
                                                                .append(
                                                                    $('<h6>' + data.engineCapacityCapacity + '<small class="text-muted"> л</small>' + ' / ' + data.power + '<small class="text-muted"> л.с.</small>' + ' / ' + data.fuelName + '</h6>')
                                                                )
                                                        )
                                                        .append(
                                                            $('<div class="col-6 pr-2">')
                                                                .append(
                                                                    $('<h6>' + data.driveUnitType + '</h6>')
                                                                )
                                                        )
                                                )
                                                .append(
                                                    $('<div class="row no-gutters mb-auto">')
                                                        .append(
                                                            $('<div class="col-6 pr-2">')
                                                                .append(
                                                                    $('<h6>' + data.transmissionName + '</h6>')
                                                                )
                                                        )
                                                        .append(
                                                            $('<div class="col-6 pr-2">')
                                                                .append(
                                                                    $('<h6>' + data.colorName + '</h6>')
                                                                )
                                                        )
                                                )
                                                .append(
                                                    $('<div>')
                                                        .append(
                                                            $('<h6>' + data.region + ', ' + data.dateAdd + '</h6>')
                                                        )
                                                )
                                        )
                                )
                        )
                )
            });

            cars.append(fragment);

            return cars;
        },
        sort: function() {
            var sort = $('<div class="row mb-2">')
                .append(
                    $('<div class="col-lg-3 col-md-5 col-sm-4 col-6">')
                        .append(
                            $('<select class="form-control">')
                                .append(
                                    $('<option selected="">По дате</option>')
                                )
                                .append(
                                    $('<option>...</option>')
                                )
                        )
                )
                .append(
                    $('<div class="col-lg-3 col-md-5 col-sm-4 col-6">')
                        .append(
                            $('<select class="form-control">')
                                .append(
                                    $('<option selected="">За все время</option>')
                                )
                                .append(
                                    $('<option>...</option>')
                                )
                        )
                );

            return sort;
        },
        emptyContent: function() {
            var content = $('<div>Empty content</div>');
            return content;
        }
    },
    link: {
        carPreviewM: function(car) {
            var car = $(car);
            car.click(function() {
                location.href = autoApp.linkAutoCar + this.dataset.id;
            });
        }
    },
    goToAnchor: function(elm, duration = 1000) {
        $('html, body').animate({scrollTop: elm.offset().top}, duration);
    },
    getElements: function(array, context) {
        array.forEach(function(selector) {
            var elm = $(selector),
                property = selector.slice(1, selector.length);
            context.elms[property] =  elm.length ? elm : $(document);
        });
    },
    run: function() {
        // set global elements
        this.getElements(this.selectors, this);
    }
};

autoApp.run();

$(function() {
    var fotoramaDiv = $('#fotorama');

    if (!fotoramaDiv.length) return;

    fotoramaDiv = fotoramaDiv.fotorama();
    var fotorama = fotoramaDiv.data('fotorama');
    fotorama.setOptions({
        arrows: false,
        allowfullscreen: true,
        width: '100%',
        height: '70%',
        nav: 'thumbs',
        thumbheight: '50',
        thumbwidth: '90',
    });
});

$(function() {
    var cars = $('.car-preview-m');

    if (!cars.length) return;

    for (var i = 0; i < cars.length; i++) {
        autoApp.link.carPreviewM(cars[i]);
    }
});

$(function() {
    var paginationHomeButton = $('#paginationHomeButton');

    if (!paginationHomeButton.length) return;

    paginationHomeButton.click(function (e) {
        $.ajax({
            type: "POST",
            url: '/auto/resourceHome',
            dataType: 'json',
            data: {
                paginationPage: ++autoApp.paginationHome
            },
            success: function(d) {
                if ( $.isEmptyObject(d) ) paginationHomeButton.remove();

                autoApp.render.carPreviewM(d);
            },
            error: function() {
                console.log('Нет подключения к Интернету');
            }
        });
    });
});

$(function() {
    autoApp.form.form.submit(function(e) {
        $.ajax({
            type: "POST",
            url: '/auto/resourceFilter',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({findCars: autoApp.form.searchParameters}),
            success: function(d) {
                if (!d || !d.resultCars) return;
                autoApp.elms.formResultsContent.html(null);
                autoApp.elms.formResultsContent.append( autoApp.render.sort() );

                if ( $.isEmptyObject(d.resultCars) )
                    autoApp.elms.formResultsContent.append( autoApp.render.emptyContent() );
                else
                    autoApp.elms.formResultsContent.append( autoApp.render.carPreviewL(d.resultCars) );

                autoApp.goToAnchor( autoApp.elms.formResultsContent );
            },
            error: function() {
                console.log('Нет подключения к Интернету');
            }
        });

        event.preventDefault();
    });

    autoApp.form.form.change(function(e) {
        var target = $(event.target),
            value = parseFloat( target.find(":selected").val() );

        if (!target.length || isNaN(value) ) return;

        var data = {
            send: {},
            callback: {}
        };

        switch ( target.attr('id') ) {
            case "autoMark":
                data = autoApp.form.event.mark(target, value);
                break;
            case "autoModel":
                data = autoApp.form.event.model(target, value);
                break;
            case "autoGeneration":
                autoApp.form.event.generation(target, value);
                break;
            case "autoCarcase":
                autoApp.form.event.carcase(target, value);
                break;
            case "autoTransmission":
                autoApp.form.event.transmission(target, value);
                break;
            case "autoFuel":
                autoApp.form.event.fuel(target, value);
                break;
            case "autoDriveUnit":
                autoApp.form.event.driveUnit(target, value);
                break;
            default:
                return;
        }

        data.send.searchParameters = autoApp.form.searchParameters;

        $.ajax({
            type: "POST",
            url: '/auto/resourceFilter',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data.send),
            autoAppCallback: data.callback,
            success: function(d) {
                !$.isFunction(this.autoAppCallback) || this.autoAppCallback(d.searchHelperResults);
                autoApp.form.render.buttonCountCars(d.searchResults);
            },
            error: function() {
                console.log('Нет подключения к Интернету');
            }
        });
    });

    autoApp.form.type.click(function(e) {
        var target = $(event.target);

        if (!target.length || target.hasClass('active')) return;

        var data = {};

        switch( target.attr('id') ) {
            case "autoAll":
                data = {
                    autoType: 'all',
                }
                break;
            case "autoNew":
                data = {
                    autoType: 'new',
                }
                break;
            case "autoMileage":
                data = {
                    autoType: 'mileage',
                }
                break;
            default:
        }

        if ( $.isEmptyObject(data) ) return;

        $.ajax({
            type: "POST",
            url: '/auto/resourceFilter',
            dataType: 'json',
            data: data,
            autoAppTarget: target,
            success: function(d) {
                autoApp.form.render.buttonAutoType({autoType: 'changed'}, this.autoAppTarget);
            },
            error: function() {
                console.log('Нет подключения к Интернету');
            }
        });
    });
});