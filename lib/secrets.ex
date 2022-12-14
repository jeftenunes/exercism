defmodule Secrets do
  require Kernel
  require Bitwise

  def secret_add(secret) do
    fn arg1 ->
      arg1 + secret
    end
  end

  def secret_subtract(secret) do
    fn arg1 ->
      arg1 - secret
    end
  end

  def secret_multiply(secret) do
    fn arg1 ->
      arg1 * secret
    end
  end

  def secret_divide(secret) do
    fn arg1 ->
      Kernel.trunc(arg1 / secret)
    end
  end

  def secret_and(secret) do
    fn arg1 ->
      Bitwise.band(arg1, secret)
    end
  end

  def secret_xor(secret) do
    fn arg1 ->
      Bitwise.bxor(arg1, secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn arg1 ->
      result_fn1 = secret_function1.(arg1)
      secret_function2.(result_fn1)
    end
  end
end
