require "spec_helper"
require "express/verbal_expressions"

describe "VerbalExpressions" do
  def expressed(method, *arguments)
    Express.new.send(method, *arguments).to_s
  end

  describe "#startOfLine" do
    it 'returns `^`' do
      expect(expressed(:startOfLine)).to eq('^')
    end
  end

  describe "#endOfLine" do
    it 'returns `$`' do
      expect(expressed(:endOfLine)).to eq('$')
    end
  end

  describe "#find" do
    it 'returns `(?:foo)`' do
      expect(expressed(:find, "foo")).to eq('(?:foo)')
    end
  end

  describe "#maybe" do
    it 'returns `(?:foo)?`' do
      expect(expressed(:maybe, "foo")).to eq('(?:foo)?')
    end
  end

  describe "#anything" do
    it 'returns `(?:.*)`' do
      expect(expressed(:anything)).to eq('(?:.*)')
    end
  end

  describe "#anythingBut" do
    it 'returns `(?:[^f]*)`' do
      expect(expressed(:anythingBut, "f")).to eq('(?:[^f]*)')
    end
  end

  describe "#something" do
    it 'returns `(?:.+)`' do
      expect(expressed(:something)).to eq('(?:.+)')
    end
  end

  describe "#somethingBut" do
    it 'returns `(?:[^f]+)`' do
      expect(expressed(:somethingBut)).to eq('(?:[^f]+)')
    end
  end

  describe "#lineBreak" do
    it 'returns `(?:(?:\n)|(?:\r\n))`' do
      expect(expressed(:lineBreak)).to eq('(?:(?:\n)|(?:\r\n))')
    end
  end

  describe "#br" do
    it 'returns `(?:(?:\n)|(?:\r\n))`' do
      expect(expressed(:br)).to eq('(?:(?:\n)|(?:\r\n))')
    end
  end

  describe "#tab" do
    it 'returns `\t`' do
      expect(expressed(:tab)).to eq('\t')
    end
  end

  describe "#anyOf" do
    it 'returns `(?:[f])`' do
      expect(expressed(:anyOf, "f")).to eq('(?:[f])')
    end
  end

  describe "#range" do
    it 'to be decided by spec'
  end

  describe "#withAnyCase" do
    it 'case insensitive search'
  end

  describe "#stopAtFirst" do
    it 'match first expression'
  end

  describe "#searchOneLine" do
    it 'only look at one line'
  end

  describe "#multiple" do
    it 'match multiple lines'
  end

  describe "#or" do
    it 'uses `|` as delimiter for or statements'
  end

  describe "#begindCapture" do
    it 'begins a capture'
  end

  describe "#endCapture" do
    it 'ends a capture'
  end
end
