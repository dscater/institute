<template>
    <div class="contenedor_gestoria">
        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap bg-principal">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">¿QUIÉNES SOMOS?</h1>
                        </div>
                    </div>
                </div>
                <div
                    class="row justify-content-between align-items-center pt-3"
                >
                    <div class="col-lg-6 d-flex flex-column address-wrap">
                        <p>Somos Gestores</p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing
                            elit, sed do eiusmod tempor incididunt ut labore et
                            dolore magna aliqua. Ut enim ad minim veniam, quis
                            nostrud exercitation ullamco laboris nisi ut aliquip
                            ex ea commodo consequat. Duis aute irure dolor in
                            reprehenderit in voluptate velit esse cillum dolore
                            eu fugiat nulla pariatur. Excepteur sint occaecat
                            cupidatat non proident, sunt in culpa qui officia
                            deserunt mollit anim id est laborum.
                        </p>
                        <div class="row mt-3">
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/traveller.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Turismo
                                </div>
                            </div>
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/businessman.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Trabajo
                                </div>
                            </div>
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/graduated.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Estudiantes
                                </div>
                            </div>
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/consultation.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Renovación
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 search-course-right p-0">
                        <img
                            :src="url_principal + '/imgs/gestoriaImg.jpg'"
                            width="100%"
                        />
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->
        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap bg-secundario2">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">SERVICIOS</h1>
                        </div>
                    </div>
                </div>
                <div
                    class="row justify-content-between align-items-center pt-3"
                >
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/traveller.png'"
                                alt=""
                            />
                            Visa de Turismo
                        </div>
                        <div class="descripcion">
                            <p>
                                Tipo de visa aplicable para pasajeros que por
                                conexiones, escalas o itinerarios que llegan a
                                un país, en el que toma el mismo medio de
                                transporte o esperan el nuevo que los lleva al
                                país
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/businessman.png'"
                                alt=""
                            />
                            Visa de Trabajo
                        </div>
                        <div class="descripcion">
                            <p>
                                Tipo de visa aplicable para pasajeros que por
                                conexiones, escalas o itinerarios que llegan a
                                un país, en el que toma el mismo medio de
                                transporte o esperan el nuevo que los lleva al
                                país
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/graduated.png'"
                                alt=""
                            />
                            Visa de Estudiantes
                        </div>
                        <div class="descripcion">
                            <p>
                                Tipo de visa aplicable para pasajeros que por
                                conexiones, escalas o itinerarios que llegan a
                                un país, en el que toma el mismo medio de
                                transporte o esperan el nuevo que los lleva al
                                país
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/consultation.png'"
                                alt=""
                            />
                            Visa de Renovación
                        </div>
                        <div class="descripcion">
                            <p>
                                Tipo de visa aplicable para pasajeros que por
                                conexiones, escalas o itinerarios que llegan a
                                un país, en el que toma el mismo medio de
                                transporte o esperan el nuevo que los lleva al
                                país
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->

        <section class="popular-course-area section-gap">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">SOLICITUD DEL SERVICIO</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 p-0 contenedor_forms">
                        <div class="card bg-secundario2">
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Nombres:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Apellidos:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Edad:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Nacionalidad:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Residencia Actual:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Ocupación/Profesión:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Email:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Teléfono/Celular:</label>
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-md-12">
                                        <button
                                            class="btn btn-warning btn-block btn-flat"
                                        >
                                            Enviar solicitud
                                            <span
                                                class="fa fa-paper-plane"
                                            ></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Start review Area -->
        <section class="review-area section-gap relative bg-secundario2">
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="row">
                    <div class="active-review-carusel-gestoria">
                        <div class="single-review item bg-principal p-3">
                            <div
                                class="title justify-content-start d-flex mt-1 mb-1"
                            >
                                <h4 class="text-white">
                                    ¿Cómo responder en la entrevista?
                                </h4>
                            </div>
                            <p>
                                Accessories Here you can find the best computer
                                accessory for your laptop, monitor, printer,
                                scanner, speaker. Here you can find the best
                                computer accessory for your laptop, monitor,
                                printer, scanner, speaker.
                            </p>
                        </div>
                        <div class="single-review item bg-principal p-3">
                            <div
                                class="title justify-content-start d-flex mt-1 mb-1"
                            >
                                <h4 class="text-white">
                                    ¿Qué hacer en una entrevista?
                                </h4>
                            </div>
                            <p>
                                Accessories Here you can find the best computer
                                accessory for your laptop, monitor, printer,
                                scanner, speaker. Here you can find the best
                                computer accessory for your laptop, monitor,
                                printer, scanner, speaker.
                            </p>
                        </div>
                        <div class="single-review item bg-principal p-3">
                            <div
                                class="title justify-content-start d-flex mt-1 mb-1"
                            >
                                <h4 class="text-white">¿Cómo prepararte?</h4>
                            </div>
                            <p>
                                Accessories Here you can find the best computer
                                accessory for your laptop, monitor, printer,
                                scanner, speaker. Here you can find the best
                                computer accessory for your laptop, monitor,
                                printer, scanner, speaker.
                            </p>
                        </div>
                        <div class="single-review item bg-principal p-3">
                            <div
                                class="title justify-content-start d-flex mt-1 mb-1"
                            >
                                <h4 class="text-white">
                                    ¿Cómo responder en la entrevista?
                                </h4>
                            </div>
                            <p>
                                Accessories Here you can find the best computer
                                accessory for your laptop, monitor, printer,
                                scanner, speaker. Here you can find the best
                                computer accessory for your laptop, monitor,
                                printer, scanner, speaker.
                            </p>
                        </div>
                        <div class="single-review item bg-principal p-3">
                            <div
                                class="title justify-content-start d-flex mt-1 mb-1"
                            >
                                <h4 class="text-white">
                                    ¿Qué hacer en una entrevista?
                                </h4>
                            </div>
                            <p>
                                Accessories Here you can find the best computer
                                accessory for your laptop, monitor, printer,
                                scanner, speaker. Here you can find the best
                                computer accessory for your laptop, monitor,
                                printer, scanner, speaker.
                            </p>
                        </div>
                        <div class="single-review item bg-principal p-3">
                            <div
                                class="title justify-content-start d-flex mt-1 mb-1"
                            >
                                <h4 class="text-white">¿Cómo prepararte?</h4>
                            </div>
                            <p>
                                Accessories Here you can find the best computer
                                accessory for your laptop, monitor, printer,
                                scanner, speaker. Here you can find the best
                                computer accessory for your laptop, monitor,
                                printer, scanner, speaker.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End review Area -->

        <!-- Start popular-course Area -->
        <section
            class="popular-course-area section-gap contact-page-area bg-principal"
        >
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">NUESTRA UBICACIÓN</h1>
                        </div>
                    </div>
                </div>
                <div
                    class="row justify-content-between align-items-center pt-3"
                >
                    <div
                        class="col-lg-6 col-md-6 search-course-right p-0"
                        id="google_map_gestoria"
                    ></div>
                    <div class="col-lg-6 d-flex flex-column address-wrap">
                        <div
                            class="single-contact-address d-flex flex-row pt-3 pb-3"
                        >
                            <div class="icon">
                                <span class="lnr lnr-home"></span>
                            </div>
                            <div class="contact-details">
                                <h5>Dirección:</h5>
                                <p>
                                    SHOPPING VIZUR Calle Mariscal Santa Cruz y
                                    Calle Arenales Castea N° 20
                                </p>
                            </div>
                        </div>
                        <div
                            class="single-contact-address d-flex flex-row pt-3 pb-3"
                        >
                            <div class="icon">
                                <span class="lnr lnr-phone-handset"></span>
                            </div>
                            <div class="contact-details">
                                <h5>Celular/Whatsapp:</h5>
                                <p>+591 63326803</p>
                                <p>+591 64312163</p>
                            </div>
                        </div>
                        <div
                            class="single-contact-address d-flex flex-row pt-3 pb-3"
                        >
                            <div class="icon">
                                <span class="lnr lnr-envelope"></span>
                            </div>
                            <div class="contact-details">
                                <h5>Email:</h5>
                                <p>info@tomorrowstoday.com</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->
    </div>
</template>
<script>
export default {
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            oContacto: {
                direccion: "",
                fonos: "",
                correo: "",
                lat: "-16.50405",
                lng: "-68.13081",
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
        let self = this;
        setTimeout(() => {
            self.initCaruselTips();
            self.cargaMapaGoogle(self.oContacto.lat, self.oContacto.lng);
        }, 300);
    },
    methods: {
        initCaruselTips() {
            $(".active-review-carusel-gestoria").owlCarousel({
                items: 3,
                margin: 30,
                loop: true,
                dots: true,
                autoplayHoverPause: true,
                smartSpeed: 650,
                autoplay: true,
                responsive: {
                    0: {
                        items: 1,
                    },
                    480: {
                        items: 1,
                    },
                    768: {
                        items: 2,
                    },
                    992: {
                        items: 3,
                    },
                },
            });
        },

        cargaMapaGoogle(lat, lng, drag = false, dir = "") {
            lat = parseFloat(lat);
            lng = parseFloat(lng);

            // Inicializa el mapa
            this.map = new google.maps.Map(
                document.getElementById("google_map_gestoria"),
                {
                    center: { lat: lat, lng: lng },
                    zoom: 18,
                }
            );

            // Configura el icono personalizado
            const customIcon = {
                url: main_url + "/imgs/pinmap.gif", // Ruta a tu icono personalizado
                scaledSize: new google.maps.Size(50, 50), // Tamaño del icono
            };

            // Crea un marcador en el centro del mapa
            this.marker = new google.maps.Marker({
                position: { lat: lat, lng: lng },
                map: this.map,
                icon: customIcon,
                draggable: drag,
            });

            // Escucha el evento de arrastrar del marcador
            google.maps.event.addListener(this.marker, "dragend", () => {
                const newPosition = this.marker.getPosition();
                this.oContacto.lat = newPosition.lat();
                this.oContacto.lng = newPosition.lng();
            });

            if (dir != "") {
                // Crea una ventana de información (infowindow) con el contenido deseado
                let self = this;
                this.infowindow = new google.maps.InfoWindow({
                    content: `<strong>DIRECCIÓN:</strong><br>${self.oContacto.direccion}`,
                });
                // Escucha el evento 'click' en el marcador para abrir la ventana de información
                this.marker.addListener("click", () => {
                    this.infowindow.open(this.map, this.marker);
                });
            }
        },
    },
};
</script>
<style>
.contenedor_gestoria .info_gestoria {
    padding: 10px;
}
.contenedor_gestoria .info_gestoria .contenido {
    border-radius: 10px;
    height: 190px;
    font-weight: bold;
}

.contenedor_gestoria .info_gestoria .contenido img {
    width: 100%;
    margin-bottom: 10px;
}

.contenedor_gestoria .contenedor_servicio {
    padding: 35px;
}

.contenedor_gestoria .contenedor_servicio .img {
    margin-bottom: 10px;
    text-align: center;
    font-weight: bold;
    font-size: 1.5em;
}
.contenedor_gestoria .contenedor_servicio .img img {
    width: 90%;
    border-radius: 50%;
    margin-bottom: 15px;
}
.contenedor_gestoria .contenedor_servicio .descripcion {
    text-align: justify;
}

#google_map_gestoria {
    height: 400px;
}

@media (max-width: 800px) {
    .contenedor_gestoria .info_gestoria .contenido {
        height: auto;
    }
    .contenedor_gestoria .info_gestoria .contenido img {
        display: block;
        margin: auto;
        margin-bottom: 10px;
        width: 60%;
    }
}
</style>
