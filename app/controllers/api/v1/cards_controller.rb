class Api::V1::CardsController < ApplicationController
  def index
    params[:page] ||= 1

    @cards = Card.ransack(params).result.page(params[:page]).per(30).includes(:product, :new_product, :picture, :triggers)
    # if params[:name_cont].present?
    #   @cards = @cards.where("name like '%#{params[:name_cont]}%'")
    # end
    #
    # if params[:card_code_cont].present?
    #   @cards = @cards.where("card_code like '%#{params[:card_code_cont]}%'")
    # end
    #
    # if params[:content_cont].present?
    #   @cards = @cards.where("content like '%#{params[:content_cont]}%'")
    # end
    #
    # if params[:feature_cont].present?
    #   @cards = @cards.where("feature like '%#{params[:feature_cont]}%'")
    # end
    render json: @cards, each_serializer: CardListSerializer, meta: @cards.pagination_info
  end

  # t.string :raw_name #原始卡名
  # t.string :name #卡名
  # t.string :card_code #卡号
  # t.integer :rarity_text #稀有度
  # t.integer :card_type #卡片种类
  # t.integer :product_id #产品类别
  # t.integer :new_product_id #新产品类别
  # t.integer :wing_type #黑翼白翼
  # t.string :work_code #工作号码
  # t.integer :color #颜色
  # t.integer :level #等级
  # t.integer :cost #花费
  # t.float :attack_value #攻击力
  # t.integer :soul #灵魂值
  # t.string :raw_url #原始链接
  # t.text :raw_content
  # t.text :content
  # t.text :raw_description
  # t.text :description
  # t.string :feature #特征
  def create
    @card = Card.find_or_initialize_by(card_code: params[:card_code])
    @card.raw_name = params[:raw_name]
    @card.rarity_text = params[:rarity]
    @card.wing_type = params[:wing_type]
    @card.work_code = params[:work_code]
    @card.card_type = params[:type_id]
    @card.color = params[:color_id]
    @card.level = params[:level].strip == "-" ? -1 : params[:level].to_i
    @card.cost = params[:cost].strip == "-" ? -1 : params[:cost].to_i
    @card.attack_value = params[:attack_value].strip == "-" ? -1 : params[:attack_value].to_f
    @card.soul = params[:soul].to_i
    @card.raw_content = params[:raw_content]
    @card.raw_description = params[:raw_description]
    @card.feature = params[:feature]
    @card.raw_url = params[:raw_url]
    #处理product和new_product
    product = Product.find_or_initialize_by(raw_name: params[:product_name])
    @card.product = product

    new_product = NewProduct.find_or_initialize_by(raw_name: params[:new_product_name])
    @card.new_product = new_product

    if params[:trigger].present?
      @card.card_triggers = []
      if params[:trigger].select {|t| t == 'soul'}.count == 2
        params[:trigger] << 'soul2'
        params[:trigger].delete('soul')
      end
      params[:trigger].each do |tr_name|
        tr = Trigger.find_or_initialize_by(raw_name: tr_name)
        @card.triggers << tr
      end
    end

    #处理图片
    if params[:remote_picture].present?
      @card.picture = Picture.new(remote_url: params[:remote_picture])
    end

    render json: {success: @card.save}
  end
end
