<template>
    <div class="content-wrapper contenedor_asignacion_grupos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administración de Cursos > Asignación de Grupos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body bg-dark">
                                <router-link
                                    :to="{
                                        name: 'asignacion_grupos.estudiantes',
                                    }"
                                    class="btn btn-success btn-flat btn-block"
                                    >Asignación Estudiantes</router-link
                                >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body bg-dark">
                                <router-link
                                    :to="{
                                        name: 'asignacion_grupos.profesores',
                                    }"
                                    class="btn btn-success btn-flat btn-block"
                                    >Asignación Profesores</router-link
                                >
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
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
        };
    },
    mounted() {
        this.loadingWindow.close();
    },
    methods: {},
};
</script>

<style></style>
