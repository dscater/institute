<template>
    <div class="content-wrapper contenedor_cursos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Cursos > Mis Cursos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12"></div>
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
            search: "",
            listRegistros: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getCursos();
    },
    methods: {
        // Listar Cursos
        getCursos() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/cursos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.listRegistros = res.data.cursos;
                });
        },
    },
};
</script>

<style>
.contenedor_cursos .img_curso {
    height: 100px;
}
</style>
