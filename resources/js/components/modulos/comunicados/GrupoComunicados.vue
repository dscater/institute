<template>
    <div class="col-md-12 mb-3 contenedor_link_comunicado">
        <div class="row">
            <div
                class="col-md-12"
                v-if="listRecursos.length > 0"
                v-for="item in listRecursos"
            >
                <div class="card mb-1">
                    <div class="card-body">
                        <div class="row fila_comunicado">
                            <span class="fecha_hora">{{ item.fecha_txt }}</span>
                            <div class="col-md-12">
                                <strong>{{ item.titulo }}</strong>
                            </div>
                            <div class="col-md-12">
                                <p class="mb-0">{{ item.descripcion }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" v-if="listRecursos.length == 0">
                <div class="card">
                    <div class="card-body">
                        <h4 class="w-100 text-center font-weight-bold text-md">
                            SIN COMUNICADOS AÚN
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        grupo_id: {
            type: Number,
            default: 0,
            requred: true,
        },
    },
    data() {
        return {
            listRecursos: [],
        };
    },
    mounted() {
        this.getRecursosGrupo();
    },
    methods: {
        getRecursosGrupo() {
            axios
                .get(
                    main_url +
                        "/admin/comunicados/getComunicadosGrupo/" +
                        this.grupo_id
                )
                .then((response) => {
                    this.listRecursos = response.data;
                    console.log(this.listRecursos);
                });
        },
    },
};
</script>
<style>
.contenedor_link_comunicado .fila_comunicado {
    position: relative;
}
.contenedor_link_comunicado .fecha_hora {
    position: absolute;
    right: 0px;
    bottom: -10px;
    font-size: 0.75em;
}
</style>
