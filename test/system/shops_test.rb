# frozen_string_literal: true

require 'application_system_test_case'

class ShopsTest < ApplicationSystemTestCase
  setup do
    @shop = shops(:one)
  end

  test 'visiting the index' do
    visit shops_url
    assert_selector 'h1', text: I18n.t('shops.index.shops')
  end

  test 'creating a Shop' do
    visit shops_url
    click_on I18n.t('shops.index.new')

    fill_in I18n.t('activerecord.attributes.shop.name'), with: @shop.name
    click_on I18n.t('helpers.submit.create', model: I18n.t('activerecord.models.shop'))

    assert_text I18n.t('shops.create.success')
    click_on I18n.t('actions.back')
  end

  test 'updating a Shop' do
    visit shops_url
    click_on I18n.t('actions.edit'), match: :first

    fill_in I18n.t('activerecord.attributes.shop.name'), with: @shop.name
    click_on I18n.t('helpers.submit.update', model: I18n.t('activerecord.models.shop'))

    assert_text I18n.t('shops.update.success')
    click_on I18n.t('actions.back')
  end

  test 'destroying a Shop' do
    visit shops_url
    page.accept_confirm do
      click_on I18n.t('actions.destroy'), match: :first
    end

    assert_text I18n.t('shops.destroy.success')
  end
end
