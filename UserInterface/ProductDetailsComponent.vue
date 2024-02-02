<template>
  <div class="product-details">
    <h3>{{ product.name }}</h3>
    <p>{{ product.description }}</p>
    <!-- More detailed information about the product -->
  </div>
</template>

<script>
export default {
  name: 'ProductDetailsComponent',
  props: {
    product: Object
  }
}
</script>

<style scoped>
.product-details {
    border: 1px solid #ccc;
    padding: 1rem;
    border-radius: 4px;
    margin-bottom: 1rem;
}
</style>
