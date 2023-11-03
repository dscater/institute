<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administración Gestoría de Visa > Servicios</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card_portal">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'gestoria_servicios.edit',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Gestoría: </strong>
                                    Servicios</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{
                                    name: 'gestoria_servicios.edit',
                                }"
                                class="card-body link_body"
                            >
                                <template v-if="oGestoriaServicio">
                                    <div class="row w-100">
                                        <div class="col-12 p-4">
                                            <p>
                                                <strong
                                                    >Visa de Turismo:</strong
                                                >
                                                {{ oGestoriaServicio.turismo }}
                                            </p>
                                            <p>
                                                <strong
                                                    >Visa de Trabajo:</strong
                                                >
                                                {{ oGestoriaServicio.trabajo }}
                                            </p>
                                            <p>
                                                <strong
                                                    >Visa de
                                                    Estudiantes:</strong
                                                >
                                                {{
                                                    oGestoriaServicio.estudiantes
                                                }}
                                            </p>
                                            <p>
                                                <strong
                                                    >Visa de Renovación:</strong
                                                >
                                                {{
                                                    oGestoriaServicio.renovacion
                                                }}
                                            </p>
                                            <hr />
                                            <p>
                                                <strong
                                                    >Mensaje al final del
                                                    formulario de
                                                    registro:</strong
                                                >
                                                {{
                                                    oGestoriaServicio.mensaje_servicio
                                                }}
                                            </p>
                                        </div>
                                    </div>
                                </template>
                                <p
                                    v-else
                                    class="font-weight-bold text-center text-gray"
                                >
                                    AÚN NO SE CONFIGURÓ LA INFORMACIÓN
                                </p>
                            </router-link>
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
            oGestoriaServicio: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getGestoriaServicios();
    },
    methods: {
        getGestoriaServicios() {
            let url = main_url + "/admin/gestoria_servicios";
            axios.get(url).then((res) => {
                if (res.data.gestoria_servicio) {
                    this.oGestoriaServicio = res.data.gestoria_servicio;
                }
            });
        },
    },
};
</script>

<style>
.link_body {
    padding: 0px;
}

.link_body img {
    width: 100%;
}

.card_portal .card-body {
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
}
.card_portal .card-header a {
    width: calc(100% - 31px);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
