document.addEventListener("DOMContentLoaded", () => {
    const deleteLinks = document.querySelectorAll("[data-action='delete']");
    deleteLinks.forEach((link) => {
      link.addEventListener("click", (event) => {
        // Mostrar una ventana emergente de confirmación
        if (!confirm("¿Estás seguro de que deseas eliminar este usuario?")) {
          event.preventDefault(); // Cancelar la acción de eliminar
        }
      });
    });
  });