<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configurar portal > Contactos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 mb-2">
                        <router-link
                            :to="{ name: 'admin_portal.index' }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-dark">
                                <h4 class="card-title font-weight-bold">
                                    INFORMACIÓN DE CONTACTO
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.direccion,
                                            }"
                                            >Dirección*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Dirección"
                                            :class="{
                                                'is-invalid': errors.direccion,
                                            }"
                                            v-model="oContacto.direccion"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.direccion"
                                            v-text="errors.direccion[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.fono1,
                                            }"
                                            >Teléfono/Celular 1*</label
                                        >
                                        <el-input
                                            placeholder="Teléfonos"
                                            :class="{
                                                'is-invalid': errors.fono1,
                                            }"
                                            v-model="oContacto.fono1"
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.fono1"
                                            v-text="errors.fono1[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.fono2,
                                            }"
                                            >Teléfono/Celular 2*</label
                                        >
                                        <el-input
                                            placeholder="Teléfonos"
                                            :class="{
                                                'is-invalid': errors.fono2,
                                            }"
                                            v-model="oContacto.fono2"
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.fono2"
                                            v-text="errors.fono2[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.correo,
                                            }"
                                            >Correo*</label
                                        >
                                        <el-input
                                            placeholder="Correo"
                                            :class="{
                                                'is-invalid': errors.correo,
                                            }"
                                            v-model="oContacto.correo"
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.correo"
                                            v-text="errors.correo[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.mapa,
                                            }"
                                            >Mapa*
                                            <small
                                                >(Ingresa el "iframe" de google
                                                maps)</small
                                            ></label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Correo"
                                            :class="{
                                                'is-invalid': errors.mapa,
                                            }"
                                            v-model="oContacto.mapa"
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.mapa"
                                            v-text="errors.mapa[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="col-md-3">
                                    <button
                                        class="btn btn-success btn-flat btn-block"
                                        @click="actualizaInformacion()"
                                    >
                                        <i class="fa fa-save"></i> Guardar
                                        cambios
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    components: {},
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            oContacto: {
                direccion: "",
                fono1: "",
                fono2: "",
                correo: "",
                mapa: `<iframe src="https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>`,
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getContacto();
    },
    methods: {
        getContacto() {
            let url = main_url + "/admin/contactos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.contacto) {
                    this.oContacto = res.data.contacto;
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/contactos";
                axios
                    .post(url, this.oContacto)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oContacto = res.data.contacto;
                        this.errors = [];
                    })
                    .catch((error) => {
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                            }
                            if (
                                error.response.status === 420 ||
                                error.response.status === 419 ||
                                error.response.status === 401
                            ) {
                                window.location = "/";
                            }
                            if (error.response.status === 500) {
                                Swal.fire({
                                    icon: "error",
                                    title: "Error",
                                    html: error.response.data.message,
                                    showConfirmButton: false,
                                    timer: 2000,
                                });
                            }
                        }
                    });
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
        cargaMapaGoogle(lat, lng, drag = false, dir = "") {
            lat = parseFloat(lat);
            lng = parseFloat(lng);

            // Inicializa el mapa
            this.map = new google.maps.Map(
                document.getElementById("google_map"),
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
#google_map {
    height: 400px;
}
</style>
