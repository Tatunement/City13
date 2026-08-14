import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Button, Section, LabeledList } from '../components';
export const Lathe = (props, context) => {
  const { act, data } = useBackend(context);
  const { selected_item_name }=data;
  return (
  <Window>
    <LabeledList>
      <LabeledList.Item>
        <h1 textAlign="centered"> Lathe Menu </h1>
        <Section width={10} height={5}>
          <label> {selected_item_name} </label>
          <Button
          onClick={() => act('next')}>
          <label> Next </label>
          </Button>
        </Section>
        <Button
          onClick={() => act('start_lathe')}
        >
          <label> Start Lathe </label>
        </Button>
      </LabeledList.Item>
    </LabeledList>

  </Window>);
};
