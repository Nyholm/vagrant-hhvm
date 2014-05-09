<?hh

class Store<T> {
  public function __construct(
    private T $data,
  ) {}

    public function get(): T
  {
      return $this->data;
  }

  public function set(T $x): void
  {
      $this->data = $x;
  }
}

function getAStore(): Store<string>
{
    $data = 'Hello Hack!';
    $x = new Store($data);
    return $x;
}

$store=getAStore();
echo $store->get();
