control 'check_pkg' do

  describe package('apache2') do
    it { should be_installed }
  end

end
