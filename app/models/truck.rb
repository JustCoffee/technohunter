# encoding: utf-8 
class Truck < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, :dependent => :destroy

	validates :region, presence:  { message: "Пожалуйста, выберите регион" }
	validates :city, presence: { message: "Пожалуйста, выберите город" }
	validates :price, presence: { message: "Пожалуйста, укажите цену" }
	validates :year, presence: { message: "Пожалуйста, укажите год выпуска" }
	validates :brand, presence: { message: "Пожалуйста, выберите марку авто" }
	validates :model, presence: { message: "Пожалуйста, выберите модель" }
	validates :year, numericality: { only_integer: true, message: "Год должен состоять из цифр" }
	validates :price, numericality: { only_integer: true, message: "Цена должна состоять из цифр" }
	validates :mileage, presence: { message: "Пожалуйста, укажите пробег" }
	validates :year, length: { is: 4, message: "Год должен состоять из 4-х цифр" }
	validates :type_avto, presence: { message: "Пожалуйста, выберите тип" }

	validates :engv, numericality: { message: "Объем двигателя должен состоять из цифр" }
end
