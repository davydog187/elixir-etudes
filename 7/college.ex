defmodule College do
  def make_room_list(file_name) do
    { _result, device } = File.open(file_name, [:read, :utf8])

    room_list = HashDict.new
    process_line(device, room_list)
  end

  defp process_line(device, room_list) do
    data = IO.read(device, :line)
    case data do
      :eof ->
        File.close(device)
        room_list
      _ ->
        update_list = process_room(data, room_list)
        process_line(device, update_list)
    end
  end

  defp process_room(data, room_list) do
    [_id, course_name, room] = String.split(data, ",")
    course_list = HashDict.get(room_list, room)
    case course_list do
      nil -> HashDict.put_new(room_list, room, [course_name])
      _ -> HashDict.put(room_list, room, [course_name | course_list])
    end
  end


end
