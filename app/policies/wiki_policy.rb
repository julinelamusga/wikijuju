class WikiPolicy
  # TODO viewing rights
  # self::Scope = Struct.new(:user, :scope) do
  #   def resolve
  #     if user.premium?
  #       scope.all
  #     else
  #       scope.where(:published => true)
  #     end
  #   end
  # end

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    @user
  end

  def new?
    @user
  end

  def show?
    @user.premium?
  end
end