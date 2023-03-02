
class Command

  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end


class Read < Command


  def initialize(receiver)
    @receiver = receiver

  end

  def execute
    puts "ReadCommand: reading \n"
    @receiver.read
  end
end

class Create < Command

  def initialize(receiver)
    @receiver = receiver

  end


  def execute
    puts "CreateCommand: created \n"
    @receiver.create
  end
end

class Update < Command

  def initialize(receiver)
    @receiver = receiver

  end

  def execute
    puts "UpdateCommand: updating \n"
    @receiver.update
  end
end


class Delete < Command

  def initialize(receiver)
    @receiver = receiver

  end

  def execute
    puts "DeleteCommand: deleted \n"
    @receiver.delete
  end
end



class Receiver

  def create
    print "\nReceiver: DB Create \n"
  end

  def read
    print "\nReceiver: DB Read \n"
  end

  def update
    print "\nReceiver: DB update \n"
  end

  def delete
    print "\nReceiver: DB delete \n"
  end

end


class Invoker



  def task1=(command)
    @task1 = command
  end

  def task2=(command)
    @task2 = command
  end

  def task3=(command)
    @task3 = command
  end

  def task4=(command)
    @task4 = command
  end

  def do_something_important

    puts "\nClient started doing something\n"

    @task1.execute if @task1.is_a? Command

    @task2.execute if @task2.is_a? Command

    @task3.execute if @task3.is_a? Command

    @task4.execute if @task4.is_a? Command

    puts "\nClient finished doing something\n"

  end
end

invoker = Invoker.new


receiver = Receiver.new
invoker.task1 = Create.new(receiver)
invoker.task2 = Read.new(receiver)
invoker.task3 = Update.new(receiver)
invoker.task4 = Delete.new(receiver)

invoker.do_something_important