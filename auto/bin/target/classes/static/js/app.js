var autoApp = {
    paginationHome: 0,
    linkAutoCar:"/auto/car/",
    autoForm: $('#autoForm'),
    form: {
        form: $('#autoForm'),
        mark: $('#autoMark'),
        model: $('#autoModel'),
        generation: $('#autoGeneration'),
    },
    create: {
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

                parent.append(elm);
                elm.slideDown(200);
            }
        }
    },
    link: {
        carPreviewM: function(car) {
            var car = $(car);
            car.click(function() {
                location.href = autoApp.linkAutoCar + this.dataset.id;
            });
        }
    }
};

$(function () {
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

$(function () {
    var cars = $('.car-preview-m');

    if (!cars.length) return;

    for (var i = 0; i < cars.length; i++) {
        autoApp.link.carPreviewM(cars[i]);
    }
});

$(function () {
    var paginationMoreButton = $('.paginationMoreButton');

    if (!paginationMoreButton.length) return;

    paginationMoreButton.click(function (e) {
        $.ajax({
            type: "POST",
            url: '/auto/resourceHome',
            dataType: 'json',
            data: {
                page: ++autoApp.paginationHome
            },
            success: function(d) {
                autoApp.create.carPreviewM(d);
            },
            error: function() {
                console.log('Нет подключения к Интернету');
            }
        });
    });
});

$(function() {
    autoApp.autoForm.change(function(e) {
        var target = $(event.target);

        if (!target.length) return;
        var data = {};

        switch (target.data().name) {
            case "mark":
                data = {
                    markId: target.find(":selected").val()
                }
                break;
            case "model":
                data = {
                    modelId: target.find(":selected").val()
                }
                break;
            default:
        }

        if ( $.isEmptyObject(data) ) return;

        $.ajax({
            type: "POST",
            url: '/auto/resourceHome',
            dataType: 'json',
            data: data,
            success: function(d) {
                console.log(d);
            },
            error: function() {
                console.log('Нет подключения к Интернету');
            }
        });
    });
});
