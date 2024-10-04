class UsersPdf
  require "prawn"
  require "prawn/table"

  def initialize(users)
    @users = users
  end

  def render
    Prawn::Document.new do |pdf|
      pdf.text "Listado de Usuarios"
      pdf.move_down 20

      # Define los encabezados y agrega más campos
      user_data = [ [ "ID", "Nombre", "Edad", "Ciudad", "Email", "Dirección", "País", "Apartamento" ] ] +
                  @users.map do |user|
                    [ user.id, user.name, user.age, user.city, user.email, user.address, user.country, user.apartment ]
                  end

      pdf.table(user_data, header: true) do
        row(0).font_style = :bold
        self.header = true
      end
    end.render
  end
end
