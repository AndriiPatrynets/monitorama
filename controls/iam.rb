describe aws_iam_user(username: 'inspec') do
    it { should_not have_console_password }
end

